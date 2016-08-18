# == Schema Information
#
# Table name: events
#
#  id               :integer          not null, primary key
#  user_id          :integer
#  title            :string
#  description      :text
#  location_name    :string
#  latitude         :decimal(10, 6)
#  longitude        :decimal(10, 6)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  slug             :string
#  location_address :string
#

class EventSerializer < ActiveModel::Serializer
  attributes :user_id, :title, :description, :price, :created_at, :updated_at
end
