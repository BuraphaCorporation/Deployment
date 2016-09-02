# == Schema Information
#
# Table name: payments
#
#  id                   :integer          not null, primary key
#  status               :string
#  methods              :string
#  omise_transaction_id :string
#  amount               :integer
#  fee                  :integer
#  slip_file_name       :string
#  slip_content_type    :string
#  slip_file_size       :integer
#  slip_updated_at      :datetime
#  approved_at          :datetime
#  paid_at              :datetime
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
  belongs_to :order, inverse_of: :payment

  has_attached_file :evidence, styles: { default: "600x700" }
  # has_attached_file :qr_code, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  # validates_attachment_content_type :qr_code, content_type: /\Aimage\/.*\z/

  # before_create :set_default_payment_code
  # after_create :set_default_payment_qr_code
  after_create :send_payment_email

  enumerize :status, in: [:success, :failure, :cancel, :pending], default: :pending
  scope :available, -> { all.reject{ |p| p.tickets.empty? } }

  # def to_s
  #   "#PM-#{code}"
  # end

  def purchased
    paid_at.try(:strftime, "%A %d %B, %H:%M")
  end

  def purchased_status
    purchased || 'pending'
  end

  def my_tickets
    tickets.current_tickets
  end

  class << self
    # omise create card
    # card = Omise::Token.create(card: {
    #   name: "Arnon Hongklay",
    #   number: "4242424242424242",
    #   expiration_month: 10,
    #   expiration_year: 2018,
    #   city: "Bangkok",
    #   postal_code: "10320",
    #   security_code: 123
    # })
    # omise_token = card.id

    def status_charging(status)
      case status
      when 'successful'
        :success
      when 'failed'
        :failure
      when 'pending', 'reversed'
        :pending
      end
    end

    def omise_customer_charge(order, omise_token)
      charge = Omise::Charge.create({
        amount:       order.price,
        currency:     "thb",
        description:  order.invoice_no,
        customer:     order.user.omise_customer_id,
        card:         omise_token
      })

      create(
        status:               status_charging(charge.status),
        methods:              'omise',
        order:                order,
        omise_transaction_id: charge.transaction.id,
        amount:               charge.transaction.amount,
        fee:                  charge.amount - charge.transaction.amount
      )
    rescue Exception => error
      { status: :error, message: error }
    end

    def omise_token_charge(order, omise_token)
      charge = Omise::Charge.create({
        amount:       order.price,
        currency:     "thb",
        description:  order.invoice_no,
        card:         omise_token
      })

      create(
        status:               status_charging(charge.status),
        methods:              'omise',
        order:                order,
        omise_transaction_id: charge.transaction.id,
        amount:               charge.transaction.amount,
        fee:                  charge.amount - charge.transaction.amount
      )

    rescue Exception => error
      { status: :error, message: error }
    end

    def transfer_notify(order)
      create(status: :pending, methods: 'transfer', order: order, amount: order.price, fee: 0)
    rescue Exception => error
      { status: :error, message: error }
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
  # def generate_code
  #   loop do
  #     code = App.generate_code
  #     break code unless Payment.exists?(code: code)
  #   end
  # end
  #
  # def set_default_payment_code
  #   self.code = generate_code
  # end
  #
  # def set_default_payment_qr_code
  #   attachment = App.generate_qr_code(self)
  #   self.qr_code = File.open(attachment, 'rb')
  # end

  def send_payment_email
    case methods
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
