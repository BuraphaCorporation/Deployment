module V1
  class TagsAPI < ApplicationAPI
    extend Defaults::Engine
    # use Rack::JSONP

    helpers do
      params :token do
        optional :token, type: String, default: nil
      end

      params :attributes do
        optional :attributes, type: Hash, default: {}
      end
    end

    resources :tags do
      desc "Return all tags"
      get "/" do
        begin
          present :status, :success
          present :data, Tag.all, with: Entities::TagExpose
        rescue Exception => e
          present :status, :failure
          present :data, e
        end
      end
    end
  end
end
