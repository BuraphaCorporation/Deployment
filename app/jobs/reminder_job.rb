class ReminderJob < ApplicationJob
  queue_as :default

  def perform
    Order.event_today.each do |order|
      UserReminderWorker.perform_async(order.id) if order.event.ticket_type.general?
    end
  rescue Exception => e
    p e
  end
end
