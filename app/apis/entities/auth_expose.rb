class Entities::AuthExpose < Grape::Entity
  expose :access_token, as: :token
  expose :is_signup, as: :is_signup do |item|
    item.created_at > Time.zone.now - 10.seconds
  end
end
