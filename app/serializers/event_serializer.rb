class EventSerializer < ActiveModel::Serializer
  attributes :user_id, :title, :description, :price
end
