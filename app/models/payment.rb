# == Schema Information
#
# Table name: payments
#
#  id                    :integer          not null, primary key
#  user_id               :integer
#  event_id              :integer
#  provider              :string
#  amount                :integer
#  fee                   :integer
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  status                :integer
#  code                  :string
#  evidence_file_name    :string
#  evidence_content_type :string
#  evidence_file_size    :integer
#  evidence_updated_at   :datetime
#  purchased_at          :datetime
#
# Indexes
#
#  index_payments_on_event_id  (event_id)
#  index_payments_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_081dc04a02  (user_id => users.id)
#  fk_rails_1a5e9ad0e2  (event_id => events.id)
#

class Payment < ActiveRecord::Base
  belongs_to :user
  belongs_to :event

  has_many :tickets, dependent: :destroy

  enum status: { failure: 0, success: 1, pending: 2 }

  has_attached_file :evidence, styles: { default: "600x700" }

  before_create do |payment|
    payment.code = Payment.code
  end
  after_create :send_payment_mail
  # after_create :add_ticket

  dragonfly_accessor :qr_code

  def send_payment_mail
    PaymentMailer.checkout(self.user).deliver!
    $slack.ping "#{self.inspect}\n #{self.user.inspect}"
  rescue
    logger.fatal self
  end

  def purchased
    purchased_at.try(:strftime, "%A %d %B, %H:%M")
  end

  def purchased_status
    purchased || 'pending'
  end

  class << self
    def code
      loop do
        code = App.generate_code
        break code unless exists?(code: code)
      end
    end

    def invoice(user, event)
      "#{Time.zone.now.strftime("%Y%m%d-%H%M")}-#{event.id}-#{user.id}"
    end

    def omise_charge(user, event, sections, amount, omise_token)
      begin
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
          amount: amount.to_i * 100,
          currency: "thb",
          description: "test", #invoice(event, user),
          card: omise_token
        })

        if charge.status == 'successful'
          pay = create(status: :success, provider: 'omise', user: user, event: event, amount: charge.transaction.amount, fee: charge.amount - charge.transaction.amount)

          sections.each do |section|
            (1..section.qty).each do |i|
              Ticket.create_ticket(user, event, section.id, pay)
            end
          end

          pay
        else
          pay = create(status: :failure, provider: 'omise', user: user, event: event, amount: charge.transaction.amount, fee: charge.amount - charge.transaction.amount)
        end
      rescue Exception => e
        e
      end
    end

    def transfer_notify(user, event, sections, amount)
      begin
        pay = create(status: :pending, provider: 'transfer', user: user, event: event, amount: amount)
        sections.each do |section|
          (1..section.qty).each do |i|
            Ticket.create_ticket(user, event, section.id, pay)
          end
        end

        pay
      rescue Exception => e
        e
      end
    end


    def transfer_checkout(user, event, evidence=nil)
      update(status: :success, user: user, event: event, evidence: evidence)
    end

    def transfer_approve(user, event, payment)
      Ticket.create_ticket(user, event, payment)
    end
  end

  private
    # def add_ticket
    #   Ticket.create_ticket(self.user, self.event, self) if provider = 'omise'
    # end
end
