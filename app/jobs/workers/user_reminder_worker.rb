module Workers
  class UserReminderWorker
    include Sidekiq::Worker
    sidekiq_options retry: 3

    def perform(order_id)
      UserMailer.reminder(order_id).deliver_now
    end
  end
end
