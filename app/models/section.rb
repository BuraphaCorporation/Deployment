# == Schema Information
#
# Table name: sections
#
#  id         :integer          not null, primary key
#  status     :string
#  event_id   :integer
#  title      :string
#  event_time :datetime
#  end_time   :datetime
#  price      :integer
#  total      :integer          default(0)
#  bought     :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_sections_on_event_id  (event_id)
#
# Foreign Keys
#
#  fk_rails_3fc873a652  (event_id => events.id)
#

class Section < ApplicationRecord
  belongs_to :event
  # has_many :tickets

  attr_accessor :section_name, :section_event_date, :section_end_date, :section_event_time, :section_end_time, :section_price, :section_available

  scope :available, -> { where("event_time > ?", Time.zone.now).order(:event_time) }
  enumerize :status, in: [:on, :off, :draft], default: :draft

  def availability?
    total - bought > 0
  end

  def to_event_human
    event_time.try(:strftime, "%A %d %B, %H:%M")
  end
end
