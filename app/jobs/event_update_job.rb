class EventUpdateJob < ApplicationJob
  queue_as :default

  def perform
    # Event.update_uptime_present
  end
end
