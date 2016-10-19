# == Schema Information
#
# Table name: tickets
#
#  id                   :integer          not null, primary key
#  status               :string
#  code                 :string
#  qr_code_file_name    :string
#  qr_code_content_type :string
#  qr_code_file_size    :integer
#  qr_code_updated_at   :datetime
#  user_id              :integer
#  event_id             :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  section_id           :integer
#  order_id             :integer
#  price                :integer
#  stages               :string
#  event_date           :datetime
#
# Indexes
#
#  index_tickets_on_event_id    (event_id)
#  index_tickets_on_order_id    (order_id)
#  index_tickets_on_section_id  (section_id)
#  index_tickets_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_4def87ea62  (event_id => events.id)
#  fk_rails_538a036fb9  (user_id => users.id)
#  fk_rails_c6410ba81d  (order_id => orders.id)
#  fk_rails_e59379c902  (section_id => sections.id)
#

FactoryGirl.define do
  factory :ticket do
    
  end
end
