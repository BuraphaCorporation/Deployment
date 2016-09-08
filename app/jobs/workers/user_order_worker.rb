class UserOrderWorker
  include Sidekiq::Worker

  def perform(order_id)
    UserMailer.order(order_id).deliver_now
  end
end
