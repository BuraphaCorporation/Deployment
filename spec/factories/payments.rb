# == Schema Information
#
# Table name: payments
#
#  id                    :integer          not null, primary key
#  user_id               :integer
#  event_id              :integer
#  provider              :string
#  amount                :integer
#  fee                   :integer
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  status                :integer
#  code                  :string
#  evidence_file_name    :string
#  evidence_content_type :string
#  evidence_file_size    :integer
#  evidence_updated_at   :datetime
#

FactoryGirl.define do
  factory :payment do
    
  end
end
