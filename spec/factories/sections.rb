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

FactoryGirl.define do
  factory :section do
    
  end
end
