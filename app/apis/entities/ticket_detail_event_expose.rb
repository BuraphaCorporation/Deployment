class Entities::TicketDetailEventExpose < Grape::Entity
  expose :title
  expose :description
  expose :location, as: :location_name
  expose :location_address do |item, options|
    "#{item.location}"
  end
  expose :latitude
  expose :longitude
end
