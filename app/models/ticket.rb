class Ticket < ActiveRecord::Base
  belongs_to :event
  belongs_to :user
  belongs_to :payment

  enum status: { passed: 0, upcoming: 1, comsume: 2 }

  def self.generate_ticket
    (0...5).map { ('A'..'Z').to_a[rand(26)] }.join
  end

  def self.create_ticket(event, user, payment)
    create(status: 1, event: event, user: user, payment: payment, code: generate_ticket)
  end

  def self.consume_ticket(ticket)
    find(ticket).update(status: 2)
  end

  def self.event_passed(ticket)
    find(ticket).update(status: 0)
  end
end
