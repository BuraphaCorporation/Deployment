class OrganizerOrderWorker
  include Sidekiq::Worker

  def perform(order_id)
    OrganizerMailer.order(order_id).deliver_now
  end
end
