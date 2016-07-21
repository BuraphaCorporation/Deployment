
module API
  module Mobile
    module Entities

      class UserExpose < Grape::Entity
        expose :email
        expose :first_name
        expose :last_name
        expose :gender
        expose :birthday
        expose :phone
        # expose :avatar do |a|
        #   a.avatar(:medium)
        # end
      end

      class CategoryExpose < Grape::Entity
        expose :id
        expose :title
      end

      class GalleryExpose < Grape::Entity
        expose :media, as: :src do |item, options|
          "http://brick.daydash.co#{item.media(:thumb)}"
        end
      end

      class TicketExpose < Grape::Entity
        expose :title
        expose :price
        expose :event_time
        expose :end_time
      end

      class EventExpose < Grape::Entity
        expose :id
        expose :title
        expose :description
        expose :latitude
        expose :longitude
        expose :categories, using: API::Mobile::Entities::CategoryExpose

        # expose :cover, as: :main_cover do |item, options|
        #   "#{item.cover(:thumb)}"
        # end
        expose :galleries, as: :covers, using: API::Mobile::Entities::GalleryExpose

        expose :sections, as: :tickets, using: API::Mobile::Entities::TicketExpose
      end
    end
  end
end
