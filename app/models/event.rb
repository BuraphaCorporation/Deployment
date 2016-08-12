class Event < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :user
  belongs_to :category

  has_and_belongs_to_many :categories

  has_many :wishlists, dependent: :destroy
  has_many :galleries, dependent: :destroy
  has_many :payments, dependent: :destroy
  has_many :tickets, dependent: :destroy
  has_many :sections, dependent: :destroy
  accepts_nested_attributes_for :sections, reject_if: :all_blank, allow_destroy: true

  scope :available, -> { joins(:sections).where("sections.event_time > ?", Time.zone.now).uniq }
  scope :today,     -> { joins(:sections).where('sections.event_time': Time.zone.now.beginning_of_day..Time.zone.now.end_of_day) }
  scope :tomorrow,  -> { joins(:sections).where('sections.event_time': Time.zone.tomorrow.beginning_of_day..Time.zone.tomorrow.end_of_day) }
  scope :upcoming,  -> { joins(:sections).where('DATE(sections.event_time) > ?', Time.zone.tomorrow) }

  # after_create :set_organizer

  def get_thumbnail
    self.galleries.present? ? self.galleries.first.try(:media, :thumb) : ''
  end

  def to_url
    slug || id
  end

  def first_section
    self.sections.min_by{|s| [s.price, s.event_time] }
  end

  private
    # def set_organizer
    #   self.user ||= User.find_by_email('hello@daydash.co')
    # end
end
