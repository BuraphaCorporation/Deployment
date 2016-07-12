
module API
  module Mobile
    class Events < Grape::API
      include API::Mobile::Defaults

      resources :events do
        desc "Return all events"
        params { optional :id, type: Integer, desc: "" }
        get "/" do
          if params[:id].present?
            present :event, Event.find(params[:id])
          else
            present :events, Event.all
          end
        end

        desc "Return events today"
        get "/today" do
          Event.where(from_to: Date.today)
        end

        desc "Return events tomorrow"
        get "/tomorrow" do
          Event.where(from_to: Date.tomorrow)
        end

        desc "Return events upcoming"
        get "/upcoming" do
          Event.where('DATE(from_to) > ?', Date.tomorrow)
        end

        desc "Return events by category"
        params { requires :title, type: String, desc: "" }
        get "/category" do
          category = Category.where(name: params[:title])
          if category.present?
            { status: :success, message: category.events }
          else
            { status: :error, message: "We don't have events by #{params[:title]}" }
          end
        end
      end
    end
  end
end
