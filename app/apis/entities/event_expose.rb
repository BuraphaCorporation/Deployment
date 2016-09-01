class Entities::EventExpose < Grape::Entity
  expose :id
  expose :title
  expose :description
  expose :location_name
  expose :location_address
  expose :latitude
  expose :longitude
  expose :max_price
  expose :min_price
  expose :uptime, as: :up_time do |item, option|
    item.uptime.utc.iso8601
  end
  expose :ticket_type
  expose :order_by_section, as: :tickets, using: Entities::SectionExpose
  expose :categories, using: Entities::CategoryExpose
  expose :event_pictures, as: :covers, using: Entities::GalleryExpose
end
