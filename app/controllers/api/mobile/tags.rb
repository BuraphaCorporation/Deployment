
module API
  module Mobile
    class Tags < Grape::API
      include API::Mobile::Defaults

      resources :tags do
        desc "Return all tags"
        get "/" do
          present :status, :success
          present :data, Tag.all, with: API::Mobile::Entities::TagExpose
        end
      end
    end
  end
end
