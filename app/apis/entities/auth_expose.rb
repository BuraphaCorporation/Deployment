class Entities::AuthExpose < Grape::Entity
  expose :token
  expose :is_signup
end
