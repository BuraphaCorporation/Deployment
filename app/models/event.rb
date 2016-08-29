# == Schema Information
#
# Table name: events
#
#  id               :integer          not null, primary key
#  user_id          :integer
#  title            :string
#  description      :text
#  location_name    :string
#  latitude         :decimal(10, 6)
#  longitude        :decimal(10, 6)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  slug             :string
#  location_address :string
#  instruction      :text
#  max_price        :integer
#  min_price        :integer
#  up_time          :datetime
#
# Indexes
#
#  index_events_on_slug     (slug) UNIQUE
#  index_events_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_0cb5590091  (user_id => users.id)
#

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
  # after_create :set_up_time
  # def set_up_time
  #   up_time = sections.available.min_by(&:event_time).event_time
  # end

  def update_up_time
    Event.all.each do |event|
      event_tim = event.sections.available.min_by(&:event_time).event_time
      update(up_time: event_time)
    end
  end

  def first_section
    self.sections.available.min_by{|s| [s.event_time, s.price] }
  end

  def to_url
    slug || id
  end

  def get_thumbnail
    self.galleries.present? ? self.galleries.first.try(:media, :thumb) : ''
  end

  # private
    # def set_organizer
    #   self.user ||= User.find_by_email('hello@daydash.co')
    # end
end
