class Entities::AuthExpose < Grape::Entity
  expose :token
  expose :is_signup, as: :is_signup do |item|
    item.created_at > Time.zone.now - 30.seconds
  end
end
