
module API
  module Mobile
    module Entities

      class Category < Grape::Entity
        expose :id
        expose :name
      end

      class Gallery < Grape::Entity
        expose :media, as: :src do |item, options|
          "#{item.media(:thumb)}"
        end
      end

      class Ticket < Grape::Entity
        expose :title
        expose :price
        expose :from_to
      end

      class Event < Grape::Entity
        expose :id
        expose :title
        expose :description
        expose :latitude
        expose :longitude
        expose :category do |item, options|
          "#{item.category.name}"
        end

        expose :cover, as: :main_cover do |item, options|
          "#{item.cover(:thumb)}"
        end
        expose :galleries, as: :covers, using: API::Mobile::Entities::Gallery

        expose :tickets, as: :tickets, using: API::Mobile::Entities::Ticket
      end
    end
  end
end
