class EventUpdateJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    Event.update_uptime_present
  end
end
