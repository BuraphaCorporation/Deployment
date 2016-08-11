class Entities::TicketDetailEventExpose < Grape::Entity
  expose :title
  expose :description
  expose :location_name
  expose :location_address
  expose :latitude
  expose :longitude
end
