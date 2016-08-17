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

FactoryGirl.define do
  factory :section do
    
  end
end
