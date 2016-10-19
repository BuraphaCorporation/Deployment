class AdminOrderNotifier
  include Sidekiq::Worker
  sidekiq_options retry: 3

  def perform(order_id)
    @order = Order.find(order_id)

    order = "Order ##{@order.code} ยอดขาย #{@order.try(:payment).try(:to_amount)} (#{@order.status}) by #{@order.payment.methods} \n"
    event = "#{@order.event.try(:title)}\n"
    customer = "#{@order.user.try(:first_name)} #{@order.user.try(:last_name)}\nเบอร์โทร #{@order.user.try(:phone)}"

    $slack.ping "@channel #{order} #{event} #{customer}"
  end
end
