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
  expose :categories, using: Entities::CategoryExpose

  # expose :cover, as: :main_cover do |item, options|
  #   "#{item.cover(:thumb)}"
  # end
  expose :event_pictures, as: :covers, using: Entities::GalleryExpose

  expose :sections, as: :tickets, using: Entities::SectionExpose
end
