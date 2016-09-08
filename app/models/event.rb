# == Schema Information
#
# Table name: events
#
#  id               :integer          not null, primary key
#  user_id          :integer
#  title            :string
#  description      :text
#  instruction      :text
#  location_name    :string
#  location_address :string
#  latitude         :decimal(10, 6)
#  longitude        :decimal(10, 6)
#  uptime           :datetime
#  max_price        :integer
#  min_price        :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  slug             :string
#  name             :string
#  ticket_type      :string
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

class Event < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :user
  belongs_to :category

  has_and_belongs_to_many :categories

  has_many :wishlists,      dependent: :destroy
  has_many :event_pictures, dependent: :destroy
  has_many :orders,         dependent: :destroy
  has_many :tickets,        dependent: :destroy
  has_many :sections,       dependent: :destroy
  accepts_nested_attributes_for :sections, reject_if: :all_blank, allow_destroy: true

  # after_create :set_organizer
  # after_create :set_uptime
  # def set_uptime
  #   uptime = sections.available.min_by(&:event_time).event_time
  # end

  enumerize :ticket_type, in: [:general, :deal], default: :general

  scope :available, -> { joins(:sections).where('sections.event_time > ?', Time.zone.now).uniq }
  scope :today,     -> { joins(:sections).where('sections.event_time': Time.zone.now.beginning_of_day..Time.zone.now.end_of_day) }
  scope :tomorrow,  -> { joins(:sections).where('sections.event_time': Time.zone.tomorrow.beginning_of_day..Time.zone.tomorrow.end_of_day) }
  scope :upcoming,  -> { joins(:sections).where('DATE(sections.event_time) > ?', Time.zone.tomorrow) }
  scope :list,      -> { where('uptime > ?', Time.zone.now).order(:uptime) }


  def to_url
    slug || id
  end

  def to_uptime
    uptime.try(:strftime, "%A %d %B, %H:%M")
  end

  def order_by_section
    sections.available.order(:event_time)
  end

  def first_section
    self.sections.available.min_by{|s| [s.event_time, s.price] }
  end

  def get_thumbnail
    self.event_pictures.present? ? self.event_pictures.first.try(:media, :thumb) : ''
  end

  def get_total_sales
    orders.sum(:price).to_f / 100
  end

  def self.update_uptime_present
    all.each do |event|
      event_time = event.sections.available.min_by(&:event_time).try(:event_time)
      event.update(uptime: event_time) unless event_time.empty?
    end
  end
  private
    def set_organizer
      self.user ||= User.find_by_email('hello@daydash.co')
    end
end
