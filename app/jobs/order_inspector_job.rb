class OrderInspectorJob < ApplicationJob
  queue_as :default

  def perform
    orders = Order.where(status: :pending).where("created_at < ?", Time.zone.now - 4.hours)

    orders.each do |order|
      order.tickets.each do |ticket|
        restore = ticket.section.bought - ticket.section.unit
        if order.event.share_ticket
          order.event.sections.update_all(bought: restore)
        else
          ticket.section.update(bought: restore)
        end
      end

      order.update(status: :unpaid)
      order.payment.update(status: :failure) if order.payment.present?
    end
  end
end
