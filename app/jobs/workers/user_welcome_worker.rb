module Workers
  class UserWelcomeWorker
    include Sidekiq::Worker
    sidekiq_options retry: 3

    def perform(user_id)
      UserMailer.welcome(user_id).deliver_now
    end
  end
end
