class Entities::EventExpose < Grape::Entity
  expose :id
  expose :title
  expose :description
  expose :location
  expose :latitude
  expose :longitude
  expose :categories, using: Entities::CategoryExpose

  # expose :cover, as: :main_cover do |item, options|
  #   "#{item.cover(:thumb)}"
  # end
  expose :galleries, as: :covers, using: Entities::GalleryExpose

  expose :sections, as: :tickets, using: Entities::TicketExpose
end
