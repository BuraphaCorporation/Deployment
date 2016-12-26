class NotificationJob < ApplicationJob
  queue_as :default

  def perform
    # p "xxx"
  end
end
