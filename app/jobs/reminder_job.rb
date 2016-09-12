class ReminderJob < ApplicationJob
  queue_as :default

  def perform
    Order.event_today.each do |order|
      UserReminderWorker.perform_async(order.id)
    end
  end
end
