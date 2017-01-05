module Workers
  class OrganizerOrderWorker
    include Sidekiq::Worker
    sidekiq_options retry: 3

    def perform(order_id)
      OrganizerMailer.order(order_id).deliver_now
    end
  end
end
