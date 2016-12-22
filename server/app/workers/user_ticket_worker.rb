class UserTicketWorker
  include Sidekiq::Worker
  sidekiq_options retry: 3

  def perform(order_id)
    UserMailer.ticket(order_id).deliver_now
  end
end
