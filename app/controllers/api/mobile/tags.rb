
module API
  module Mobile
    class Tags < Grape::API
      include API::Mobile::Defaults

      resources :tags do
        desc "Return all events"
        get "/" do
          present :status, :success
          present :data, Tag.all
        end
      end
    end
  end
end

