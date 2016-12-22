# == Schema Information
#
# Table name: payments
#
#  id                   :integer          not null, primary key
#  status               :string
#  methods              :string
#  omise_transaction_id :string
#  amount               :integer
#  fee                  :integer
#  slip_file_name       :string
#  slip_content_type    :string
#  slip_file_size       :integer
#  slip_updated_at      :datetime
#  approved_at          :datetime
#  paid_at              :datetime
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  order_id             :integer
#
# Indexes
#
#  index_payments_on_order_id  (order_id)
#
# Foreign Keys
#
#  fk_rails_6af949464b  (order_id => orders.id)
#

FactoryGirl.define do
  factory :payment do
    
  end
end
