
module API
  module Mobile
    class Events < Grape::API
      include API::Mobile::Defaults

      resources :events do
        desc "Return all events"
        get "/" do
          present :status, :success
          present :data, Event.all
        end


        desc "Return events today"
        get "/today" do
          events_today = Event.today
          # if events_today.present?
            present :status, :success
            present :data, events_today, with: API::Mobile::Entities::Event
          # else
          #   present :status, :error
          #   present :data, :error
          # end
        end

        desc "Return events tomorrow"
        get "/tomorrow" do
          events_tomorrow = Event.tomorrow
          # if events_tomorrow.present?
            present :status, :success
            present :data, events_tomorrow, with: API::Mobile::Entities::Event
          # else
          #   present :status, :error
          #   present :data, :error
          # end
        end

        desc "Return events upcoming"
        get "/upcoming" do
          events_upcoming = Event.upcoming
          # if events_upcoming.present?
            present :status, :success
            present :data, events_upcoming, with: API::Mobile::Entities::Event
          # else
          #   present :status, :error
          #   present :data, :error
          # end
        end

        desc "Return events by category"
        params { requires :title, type: String, desc: "" }
        get "/category" do
          category = Category.where(name: params[:title])
          if category.present?
            present :status, :success
            present :data, category.events, with: API::Mobile::Entities::Event
          else
            present :status, :error
            present :data, "error"
          end
        end
      end

      resources :event do
        desc "Return a event"
        params do
          requires :event_id, type: Integer, desc: "slug of event"
        end
        get "/" do
          if params[:event_id].present?
            present :status, :success
            present :data, Event.find(params[:event_id]), with: API::Mobile::Entities::Event
          else
            present :status, :error
            present :data, "id not found"
          end
        end

        desc "return categories"
        get "/categories" do
          present :status, :success
          present :data, Category.all, with: API::Mobile::Entities::Cate
        end
      end
    end
  end
end
