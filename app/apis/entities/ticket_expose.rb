class Entities::TicketExpose < Grape::Entity
  expose :event
  expose :section
  expose :payment
end
