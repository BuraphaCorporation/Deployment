module Defaults
  module V1
    extend ActiveSupport::Concern

    included do
      # prefix "api"
      version 'v1', using: :path
      default_format :json
      format :json
      formatter :json, Grape::Formatter::ActiveModelSerializers
    end
  end
end
