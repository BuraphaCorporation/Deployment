class NotificationJob < ApplicationJob
  queue_as :default

  def perform
    orders = Order.where(status: :pending).where("created_at < ?", Time.zone.now - 70.minutes)

    orders.update_all(status: :unpaid)

    orders.each do |order|
      order.payment.update(status: :failure)
    end
  end
end
