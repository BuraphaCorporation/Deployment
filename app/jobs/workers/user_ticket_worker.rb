class UserTicketWorker
  include Sidekiq::Worker

  def perform(order_id)
    UserMailer.ticket(order_id).deliver_now
  end
end
