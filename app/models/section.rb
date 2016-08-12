class Section < ApplicationRecord
  belongs_to :event
  # has_many :tickets

  enum status: { on: 1, off: 0 }
  attr_accessor :section_name, :section_event_date, :section_end_date, :section_event_time, :section_end_time, :section_price, :section_available

  def event_time_human
    event_time.strftime("%A %d %B, %H:%M")
  end

  def end_time_human
    end_time.strftime("%A %d %B, %H:%M")
  end
end
