module V1
  class EventsAPI < ApplicationAPI
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

    resources :event do
      desc "Return a event"
      params do
        requires :event_id, type: Integer, desc: "slug of event"
      end
      get "/" do
        begin
          if params[:event_id].present?
            present :status, :success
            present :data, Event.friendly.find(params[:event_id]), with: Entities::EventExpose
          else
            present :status, :failure
            present :data, "id not found"
          end
        rescue Exception => e
          present :status, :failure
          present :data, e
        end
      end

      desc "return categories"
      get "/categories" do
        begin
          present :status, :success
          present :data, Category.all, with: Entities::CategoryExpose
        rescue Exception => e
          present :status, :failure
          present :data, e
        end
      end
    end

    resources :events do
      desc "Return all events"
      get "/" do
        begin
          present :status, :success
          present :data, Event.list, with: Entities::EventExpose
        rescue Exception => e
          present :status, :failure
          present :data, e
        end
      end

      desc "Return events today"
      get "/today" do
        begin
          events_today = Event.today
          present :status, :success
          present :data, events_today, with: Entities::EventExpose
        rescue Exception => e
          present :status, :failure
          present :data, e
        end
      end

      desc "Return events tomorrow"
      get "/tomorrow" do
        begin
          events_tomorrow = Event.tomorrow
          present :status, :success
          present :data, events_tomorrow, with: Entities::EventExpose
        rescue Exception => e
          present :status, :failure
          present :data, e
        end
      end

      desc "Return events upcoming"
      get "/upcoming" do
        begin
          events_upcoming = Event.upcoming
          present :status, :success
          present :data, events_upcoming, with: Entities::EventExpose
        rescue Exception => e
          present :status, :failure
          present :data, e
        end
      end

      desc "Return events by category"
      params { requires :title, type: String, desc: "" }
      get "/category" do
        begin
          category = Category.where(name: params[:title])
          if category.present?
            present :status, :success
            present :data, category.events, with: Entities::EventExpose
          else
            present :status, :failure
            present :data, nil
          end
        rescue Exception => e
          present :status, :failure
          present :data, e
        end
      end
    end
  end
end
