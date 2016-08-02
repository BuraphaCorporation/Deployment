class Payment < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  belongs_to :ticket

  enum status: { failure: 0, success: 1, pending: 2 }

  has_attached_file :evidence, styles: { default: "600x700" }

  before_create do |payment|
    payment.code = Payment.code
  end

  class << self
    def code
      loop do
        code = App.generate_code
        break code unless exists?(code: code)
      end
    end

    def omise(user_token, event, charge)
      user = User.find_by_token(user_token)
      event = Event.friendly.find(event)
      payment = create(status: :success, user: user, provider: 'omise', event: event, amount: charge.transaction.amount, fee: charge.amount - charge.transaction.amount)

      Ticket.create_ticket(user, event, payment)

      payment
    end

    def transfer(user_token, event, evidence, amount)
      user = User.find_by_token(user_token)
      event = Event.friendly.find(event)

      create(status: :pending, user: user, provider: 'transfer', event: event, evidence: evidence, amount: amount)
    end

    def transfer_notify(user_token, event)
      user = User.find_by_token(user_token)
      event = Event.friendly.find(event)

      create(status: :pending, user: user, event: event)
    end

    def transfer_approve(user, event, payment)
      Ticket.create_ticket(user, event, payment)
    end
  end
end
