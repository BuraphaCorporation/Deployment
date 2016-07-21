class Section < ApplicationRecord
  belongs_to :event

  enum status: { on: 1, off: 0 }

  attr_accessor :section_name, :section_event_date, :section_end_date, :section_event_time, :section_end_time, :section_price, :section_avaliable

end
