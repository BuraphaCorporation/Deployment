# == Schema Information
#
# Table name: sections
#
#  id            :integer          not null, primary key
#  status        :string
#  event_id      :integer
#  title         :string
#  event_time    :datetime
#  end_time      :datetime
#  price         :integer
#  total         :integer          default(0)
#  bought        :integer          default(0)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  unit          :integer          default(1)
#  initial_price :integer
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
  SHOW_TICKET_FREE = 1

  belongs_to :event
  has_many :tickets

  attr_accessor :section_name, :section_event_date, :section_end_date, :section_event_time, :section_end_time, :section_price, :section_available

  scope :available, -> { where("event_time > ?", Time.zone.now).order(:event_time) }
  scope :total, -> { sum(:total) }

  enumerize :status, in: [:on, :off, :draft], default: :draft



  def bought
    self.tickets.count
  end

  def ticket_availability?
    total - bought > 0
  end

  def ticket_available
    total - bought
  end

  def free?
    price == 0
  end

  def show_ticket_available
    if self.free?
      return SHOW_TICKET_FREE
    end

    if self.ticket_type.general?
      self.ticket_available > SHOW_TICKET_AVAILABLE ? SHOW_TICKET_AVAILABLE : self.ticket_available
    else
      SHOW_TICKET_AVAILABLE
    end
  end

  def sold_out?
    show_ticket_available <= 0
  end

  def expired_time?
    event_time <= Time.zone.now
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
      section_selected.update(bought: find(id).bought + qty)
    end
  end

  def percent
    ((self.initial_price.to_f - self.price.to_f) / self.initial_price.to_f * 100.0).to_i
  end

  def discount
    self.initial_price - self.price
  end

  def to_event_human
    event_time.try(:strftime, "%A %d %B, %H:%M")
  end
end
