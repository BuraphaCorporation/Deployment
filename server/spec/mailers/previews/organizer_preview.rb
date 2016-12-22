# Preview all emails at http://localhost:3000/rails/mailers/organizer
class OrganizerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/organizer/order

  def order_transfer
    order = Payment.where(methods: 'transfer').first.order
    OrganizerMailer.order(order.id)
  end

  def order_omise
    order = Payment.where(methods: 'omise').first.order
    OrganizerMailer.order(order.id)
  end
end
