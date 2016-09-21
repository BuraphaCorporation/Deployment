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
#  unit       :integer          default(1)
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
  SHOW_TICKET_AVAILABLE = 5

  belongs_to :event
  has_many :tickets

  attr_accessor :section_name, :section_event_date, :section_end_date, :section_event_time, :section_end_time, :section_price, :section_available

  scope :available, -> { where("event_time > ?", Time.zone.now).order(:event_time) }

  enumerize :status, in: [:on, :off, :draft], default: :draft

  def ticket_availability?
    total - bought > 0
  end

  def ticket_available
    total - bought
  end

  def show_ticket_available
    if self.ticket_type.general?
      self.ticket_available > SHOW_TICKET_AVAILABLE ? SHOW_TICKET_AVAILABLE : self.ticket_available
    else
      SHOW_TICKET_AVAILABLE
    end
  end

  def ticket_type
    self.event.ticket_type
  end

  def self.cut_in(id, qty, event)
    section_selected = find(id)
    if event.share_ticket
      event.sections.each do |section|
        section.update(bought: section.bought + (section_selected.unit * qty))
      end
    else
      section_selected(id).update(bought: find(id).bought + qty)
    end
  end

  def to_event_human
    event_time.try(:strftime, "%A %d %B, %H:%M")
  end
end
