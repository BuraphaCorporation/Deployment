class Ticket < ActiveRecord::Base
  belongs_to :event
  belongs_to :user
  belongs_to :payment

  enum status: { passed: 0, upcoming: 1, comsume: 2 }

  before_create do |ticket|
    ticket.code = Ticket.code
  end

  class << self
    def code
      loop do
        code = App.generate_code
        break code unless exists?(code: code)
      end
    end

    def create_ticket(event, user, payment)
      create(status: 1, event: event, user: user, payment: payment)
    end

    def consume_ticket(ticket)
      find(ticket).update(status: 2)
    end

    def event_passed(ticket)
      find(ticket).update(status: 0)
    end
  end
end
