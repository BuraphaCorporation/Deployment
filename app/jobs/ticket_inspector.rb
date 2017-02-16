class TicketInspectorJob < ApplicationJob
  queue_as :default

  def perform
    # tickets = Ticket.where("event_date < ?", Time.zone.yesterday)
    # tickets.update_all(stages: :passed)
  end
end
