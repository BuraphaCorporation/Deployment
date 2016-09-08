class EventUpdateJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Event.update_uptime_present
  end
end
