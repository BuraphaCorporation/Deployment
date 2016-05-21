class Event < ActiveRecord::Base

  has_many :event_attachments

  belongs_to :user
  belongs_to :category

  has_attached_file :cover, styles: { medium: "300x300>", thumb: "100x100#" },
                    default_url: "/images/:style/missing.png"
  validates_attachment_content_type :cover,
                                    content_type: /\Aimage\/.*\Z/


  after_create :set_organizer

  private
    def set_organizer
      self.user ||= User.find_by_email("hello@daydash.co")
    end
end
