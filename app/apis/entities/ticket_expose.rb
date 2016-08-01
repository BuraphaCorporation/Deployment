class Entities::TicketExpose < Grape::Entity
  expose :title
  expose :price
  expose :event_time
  expose :end_time
end
