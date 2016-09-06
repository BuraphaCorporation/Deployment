class Entities::TicketDetailUserExpose < Grape::Entity
  expose :email
  expose :first_name
  expose :last_name
  expose :gender
  expose :birthday
  expose :phone
end
