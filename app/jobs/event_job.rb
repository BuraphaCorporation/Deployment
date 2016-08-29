class EventJob < ApplicationJob
  queue_as :default

  def perform(event)
    # Do something later
    event.update_up_time
  end
end
