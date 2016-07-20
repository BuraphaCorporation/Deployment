
module API
  module Mobile
    module Defaults
      extend ActiveSupport::Concern

      included do
        # prefix ""
        version "mobile", using: :path #, vendor: 'api'
        default_format :json
        format :json
        formatter :json, Grape::Formatter::ActiveModelSerializers

        helpers do
          def permitted_params
            @permitted_params ||= declared(params,
               include_missing: false)
          end

          def logger
            Rails.logger
          end

          def current_user
            @current_user ||= User.authorize!(env)
          end

          def authenticate!
            error!('401 Unauthorized', 401) unless current_user
          end

        end

        rescue_from ActiveRecord::RecordNotFound do |e|
          error_response(message: e.message, status: 404)
        end

        rescue_from ActiveRecord::RecordInvalid do |e|
          error_response(message: e.message, status: 422)
        end
      end
    end

    module Entities

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
