class EventJob < ApplicationJob
  queue_as :default

  def perform
    Event.update_uptime
  end
end
