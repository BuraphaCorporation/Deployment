# == Schema Information
#
# Table name: orders
#
#  id                   :integer          not null, primary key
#  user_id              :integer
#  event_id             :integer
#  status               :string
#  code                 :string
#  qr_code_file_name    :string
#  qr_code_content_type :string
#  qr_code_file_size    :integer
#  qr_code_updated_at   :datetime
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
# Indexes
#
#  index_orders_on_event_id  (event_id)
#  index_orders_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_64bd9e45d4  (event_id => events.id)
#  fk_rails_f868b47f6a  (user_id => users.id)
#

class Order < ApplicationRecord
  belongs_to :user, inverse_of: :orders
  belongs_to :event, inverse_of: :orders

  has_many :tickets, dependent: :destroy
  has_many :payments, dependent: :destroy

  def to_s
    "#OD-#{code}"
  end

private
  def code
    loop do
      code = App.generate_code
      break code unless self.exists?(code: code)
    end
  end

  def invoice(user, event)
    "#{Time.zone.now.strftime("%Y%m%d-%H%M")}-#{event.id}-#{user.id}"
  end
end
