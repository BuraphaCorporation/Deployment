module Defaults
  module Mobile
    extend ActiveSupport::Concern

    included do
      # prefix "api"
      version "mobile", using: :path
      default_format :json
      format :json
      formatter :json,
           Grape::Formatter::ActiveModelSerializers

      helpers do
        def permitted_params
          @permitted_params ||= declared(params,
             include_missing: false)
        end

        def logger
          Rails.logger
        end

        # https://mikecoutermarsh.com/rails-grape-api-key-authentication/
        def authenticate!
          error!('Unauthorized. Invalid or expired token.', 401) unless current_user
        end

        def current_user
          token = ApiKey.where(access_token: params[:token]).first
          if token && !token.expired?
            @current_user = User.find(token.user_id)
          else
            false
          end
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
end
