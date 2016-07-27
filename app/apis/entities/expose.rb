module Entities
  module Expose
    class User < Grape::Entity
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

    class Tag < Grape::Entity
      expose :id
      expose :title
    end

    class Category < Grape::Entity
      expose :id
      expose :title
    end

    class Gallery < Grape::Entity
      expose :media, as: :src do |item, options|
        "#{item.media(:thumb)}"
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
      expose :location
      expose :latitude
      expose :longitude
      expose :categories, using: Entities::Expose::Category

      # expose :cover, as: :main_cover do |item, options|
      #   "#{item.cover(:thumb)}"
      # end
      expose :galleries, as: :covers, using: Entities::Expose::Gallery

      expose :sections, as: :tickets, using: Entities::Expose::TicketExpose
    end
  end
end
