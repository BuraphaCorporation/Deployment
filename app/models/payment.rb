class Payment < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  belongs_to :ticket

  enum status: { failure: 0, success: 1, pending: 2 }

  has_attached_file :evidence, styles: { default: "600x700" }

  before_create do |payment|
    payment.code = Payment.code
  end
  # after_create :add_ticket

  class << self
    def code
      loop do
        code = App.generate_code
        break code unless exists?(code: code)
      end
    end

    def invoice(event, user)
      "#{Time.zone.now.strftime("%Y%m%d-%H%M")}-#{event.id}-#{user.id}"
    end

    def omise_charge(event, user, amount, omise_token)
      charge = Omise::Charge.create({
        amount: amount.to_i * 100,
        currency: "thb",
        description: invoice(event, user),
        card: omise_token
      })

      pay = create(status: :success, user: user, provider: 'omise', event: event, amount: charge.transaction.amount, fee: charge.amount - charge.transaction.amount)
      Ticket.create_ticket(user, event, pay)
      pay
    end

    def transfer_checkout(event, user, evidence=nil)
      # create(status: :pending, user: user, event: event, evidence: evidence)
    end

    def transfer_notify(event, user, amount)
      create(status: :pending, user: user, provider: 'transfer', event: event, amount: amount)
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
