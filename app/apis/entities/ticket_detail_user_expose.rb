class Entities::TicketDetailUserExpose < Grape::Entity
  expose :email
  expose :first_name
  expose :last_name
  expose :gender
  expose :date_of_birth, as: :birthday
  expose :phone
end
