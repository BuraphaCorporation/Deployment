class ReminderJob < ApplicationJob
  queue_as :default

  def perform
    # Payment.all.each
  end
end
