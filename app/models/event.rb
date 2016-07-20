class Event < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :galleries, dependent: :destroy
  has_many :tickets, dependent: :destroy
  has_many :wishlists, dependent: :destroy

  # has_attached_file :cover,
  #   styles: { full: "1600x555#", normal2x: "750x590#", normal3x: "1125x885#", thumb2x: "750x450#", thumb3x: "1125x675#", thumb: '800x500#', facebook: "1200x630" },
  #   default_url: "/images/:style/missing.png"
  # validates_attachment_content_type :cover,
  #                                   content_type: /\Aimage\/.*\Z/

  attr_accessor :ticket_name, :ticket_price, :ticket_date, :ticket_time

  scope :today, -> { joins(:tickets).where("tickets.from_to": Time.zone.now.beginning_of_day..Time.zone.now.end_of_day) }
  scope :tomorrow, -> { joins(:tickets).where("tickets.from_to": Time.zone.tomorrow.beginning_of_day..Time.zone.tomorrow.end_of_day) }
  scope :upcoming, -> { joins(:tickets).where('DATE(tickets.from_to) > ?', Time.zone.tomorrow) }

  after_create :set_organizer

  private
    def set_organizer
      self.user ||= User.find_by_email("hello@daydash.co")
    end
end
