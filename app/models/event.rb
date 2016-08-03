class Event < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:finders]

  belongs_to :user
  belongs_to :category

  has_and_belongs_to_many :categories

  has_many :wishlists, dependent: :destroy
  has_many :galleries, dependent: :destroy
  has_many :sections, dependent: :destroy
  accepts_nested_attributes_for :sections, reject_if: :all_blank, allow_destroy: true

  scope :today,    -> { joins(:sections).where('sections.event_time': Time.zone.now.beginning_of_day..Time.zone.now.end_of_day) }
  scope :tomorrow, -> { joins(:sections).where('sections.event_time': Time.zone.tomorrow.beginning_of_day..Time.zone.tomorrow.end_of_day) }
  scope :upcoming, -> { joins(:sections).where('DATE(sections.event_time) > ?', Time.zone.tomorrow) }

  after_create :set_organizer

  def get_thumbnail
    if self.galleries.present?
      self.galleries.first.try(:media, :thumb)
    else
      ''
    end
  end

  private
    def set_organizer
      self.user ||= User.find_by_email('hello@daydash.co')
    end
end
