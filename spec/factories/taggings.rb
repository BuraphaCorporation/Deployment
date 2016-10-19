# == Schema Information
#
# Table name: taggings
#
#  id         :integer          not null, primary key
#  event_id   :integer
#  tag_id     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_taggings_on_event_id  (event_id)
#  index_taggings_on_tag_id    (tag_id)
#
# Foreign Keys
#
#  fk_rails_4784fd6341  (event_id => events.id)
#  fk_rails_9fcd2e236b  (tag_id => tags.id)
#

FactoryGirl.define do
  factory :tagging do
    
  end
end
