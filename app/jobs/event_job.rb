class EventJob < ApplicationJob
  queue_as :default

  def perform
    # Do something later
    Event.update_uptime
  end
end
