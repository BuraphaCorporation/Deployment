
module API
  module Mobile
    module Defaults
      extend ActiveSupport::Concern

      included do
        # prefix ""
        version "mobile", using: :path #, vendor: 'api'
        default_format :json
        format :json
        # formatter :json, Grape::Formatter::ActiveModelSerializers

        # helpers do
        #   def permitted_params
        #     @permitted_params ||= declared(params,
        #        include_missing: false)
        #   end
        #
        #   def logger
        #     Rails.logger
        #   end
        #
        #   def current_user
        #     @current_user ||= User.authorize!(env)
        #   end
        #
        #   def authenticate!
        #     error!('401 Unauthorized', 401) unless current_user
        #   end
        # end
        #
        # rescue_from ActiveRecord::RecordNotFound do |e|
        #   error_response(message: e.message, status: 404)
        # end
        #
        # rescue_from ActiveRecord::RecordInvalid do |e|
        #   error_response(message: e.message, status: 422)
        # end
      end
    end
  end
end
