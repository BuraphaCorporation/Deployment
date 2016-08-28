class MailWorker
  include Sidekiq::Worker

  def perform(name, count)
    p "xx"
  end
end
