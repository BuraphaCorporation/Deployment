class Event < ActiveRecord::Base

  has_many :event_attachments

  belongs_to :user

end
