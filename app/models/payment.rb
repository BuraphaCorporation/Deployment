class Payment < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  belongs_to :ticket

  enum status: { failure: 0, success: 1, pending: 2 }

  has_attached_file :evidence, styles: { default: "600x700" }

  def self.omise(user_token, event, charge)
    user = User.find_by_token(user_token)
    event = Event.find(event)

    transaction = Omise::Transaction.retrieve(charge.transaction.id)

    payment = create(status: :success, user: user, event: event, amount: transfer.amount, fee: transfer.fee)

    Ticket.create_ticket(user, event, payment)
  end

  def self.transfer(user_token, event, evidence, amount)
    user = User.find_by_token(user_token)
    event = Event.find(event)

    create(status: :pending, user: user, event: event, evidence: evidence, amount: amount)
  end

  def self.transfer_approve(user, event, payment)
    Ticket.create_ticket(user, event, payment)
  end
end
