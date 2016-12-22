class EventUpdateJob < ApplicationJob
  queue_as :default

  def perform
    # Event.update_uptime_present
    Event.update_deal_event
  end
end
