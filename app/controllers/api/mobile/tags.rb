
module API
  module Mobile
    class Tags < Grape::API
      include API::Mobile::Defaults

      resources :tags do
        desc "return all tags"
        get '/' do
          present :tags, Tag.all
        end
      end

      resources :tag do
        desc "return event by tag"
        get '/' do
          "V2"
        end

      end
    end
  end
end
