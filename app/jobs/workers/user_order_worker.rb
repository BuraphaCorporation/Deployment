module Workers
  class UserOrderWorker
    include Sidekiq::Worker
    sidekiq_options retry: 3

    def perform(order_id)
      UserMailer.order(order_id).deliver_now
    end
  end
end
