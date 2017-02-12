# == Schema Information
#
# Table name: categories_events
#
#  category_id :integer          not null
#  event_id    :integer          not null
#
# Indexes
#
#  index_categories_events_on_category_id_and_event_id  (category_id,event_id)
#  index_categories_events_on_event_id_and_category_id  (event_id,category_id)
#

FactoryGirl.define do
  factory :categories_event do
    
  end
end
