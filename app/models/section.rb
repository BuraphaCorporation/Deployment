# == Schema Information
#
# Table name: sections
#
#  id         :integer          not null, primary key
#  status     :integer          default("off")
#  event_id   :integer
#  title      :string
#  event_time :datetime
#  end_time   :datetime
#  price      :integer
#  available  :integer          default(0)
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

  enum status: { on: 1, off: 0 }
  attr_accessor :section_name, :section_event_date, :section_end_date, :section_event_time, :section_end_time, :section_price, :section_available

  def to_event_human
    event_time.try(:strftime, "%A %d %B, %H:%M")
  end
end
