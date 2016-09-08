class OrderInspectorJob < ApplicationJob
  queue_as :default

  def perform
    orders = Order.where(status: :pending).where("created_at < ?", Time.zone.now - 60.minutes)

    orders.each do |order|
      order.tickets.each do |ticket|
        ticket.section.update(bought: ticket.section.bought + 1)
      end
      order.payment.update(status: :failure)
    end

    orders.update_all(status: :unpaid)
  end
end
