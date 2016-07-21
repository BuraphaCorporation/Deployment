class Ticket < ActiveRecord::Base
  belongs_to :event
  belongs_to :user
  belongs_to :payment

  # enum status: { off: 0, on: 1 }
end
