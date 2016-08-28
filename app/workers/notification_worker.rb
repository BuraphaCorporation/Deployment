class NotificationWorker
  include Sidekiq::Worker
  sidekiq_options expires_in: 1.hour

  def perform(email)
    UserMailer.auction_notice(email).deliver_now
  end
end
