# == Schema Information
#
# Table name: payments
#
#  id                   :integer          not null, primary key
#  status               :string
#  code                 :string
#  qr_code_file_name    :string
#  qr_code_content_type :string
#  qr_code_file_size    :integer
#  qr_code_updated_at   :datetime
#  methods              :string
#  omise_transaction_id :string
#  amount               :integer
#  fee                  :integer
#  slip_file_name       :string
#  slip_content_type    :string
#  slip_file_size       :integer
#  slip_updated_at      :datetime
#  purchased_at         :datetime
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  order_id             :integer
#
# Indexes
#
#  index_payments_on_order_id  (order_id)
#
# Foreign Keys
#
#  fk_rails_6af949464b  (order_id => orders.id)
#

class Payment < ApplicationRecord
  belongs_to :order, inverse_of: :payments

  has_attached_file :evidence, styles: { default: "600x700" }
  has_attached_file :qr_code, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"

  validates_attachment_content_type :qr_code, content_type: /\Aimage\/.*\z/

  scope :available, -> { all.reject{ |p| p.tickets.empty? } }
  enumerize :status, in: [:success, :failure, :cancel, :pending], default: :pending

  before_create :set_default_payment_code
  after_create :set_default_qr_code
  after_create :send_payment_email

  def to_s
    "#PM-#{code}"
  end

  def purchased
    purchased_at.try(:strftime, "%A %d %B, %H:%M")
  end

  def purchased_status
    purchased || 'pending'
  end

  def my_tickets
    tickets.current_tickets
  end

  class << self
    def omise_charge(user, event, sections, amount, omise_token)
      # card = Omise::Token.create(card: {
      #   name: "Somchai Prasert",
      #   number: "4242424242424242",
      #   expiration_month: 10,
      #   expiration_year: 2018,
      #   city: "Bangkok",
      #   postal_code: "10320",
      #   security_code: 123
      # })
      # omise_token = card.id

      charge = Omise::Charge.create({
        amount:       amount.to_i * 100,
        currency:     "thb",
        description:  invoice(user, event),
        customer:     user.customer_token,
        card:         omise_token
      })

      pay = create(status: charge.status, provider: 'omise', user: user, event: event, amount: charge.transaction.amount, fee: charge.amount - charge.transaction.amount)

      if pay.new_record?
        sw.each do |section|
          (1..section.qty).each do |i|
            Ticket.create_ticket(user, event, section.id, pay)
          end
        end
      end
    rescue Exception => error
      error
    # ensure
    #   pay
    end

    def transfer_notify(user, event, sections, amount)
      pay = create(status: :pending, provider: 'transfer', user: user, event: event, amount: amount)

      sections.each do |section|
        (1..section.qty).each do |i|
          Ticket.create_ticket(user, event, section.id, pay)
        end
      end

      pay
    rescue Exception => error
      error
    end

    def transfer_checkout(user, event, evidence=nil)
      update(status: :success, user: user, event: event, evidence: evidence)
    end

    def transfer_cancel(payment)
      # payment.
    end

    def transfer_approval(user, event, payment)
      Ticket.create_ticket(user, event, payment)
    end
  end

private
  def code
    loop do
      code = App.generate_code
      break code unless self.exists?(code: code)
    end
  end

  def set_default_payment_code
    payment.code = Payment.code
  end

  def set_default_qr_code
    attachment = App.generate_qr_code(self)
    self.qr_code = File.open(attachment, 'rb')
  end

  def send_payment_email
    case provider
    when 'transfer'
      OrganizerMailer.order(self, self.user, self.event).deliver!
      PaymentMailer.order(self, self.user, self.event).deliver!
      PaymentMailer.ticket(self, self.user, self.event).deliver!
    when 'omise'
      OrganizerMailer.order(self, self.user, self.event).deliver!
      PaymentMailer.order(self, self.user, self.event).deliver!
    end
    $slack.ping "#{self.inspect}\n #{self.user.inspect}"
  rescue
    logger.fatal self
  end
end
