class EventSerializer < ActiveModel::Serializer
  attributes :user_id, :title, :description, :price, :created_at, :updated_at
end
