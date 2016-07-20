
module API
  module Mobile
    class Events < Grape::API
      include API::Mobile::Defaults

      resources :event do
        desc "Return a event"
        params do
          requires :event_id, type: Integer, desc: "slug of event"
        end
        get "/" do
          if params[:event_id].present?
            { status: :success, data: Event.find(params[:event_id]), message: nil }
          else
            { status: :success, data: Event.all, message: nil }
          end
        end
      end

      resources :events do
        desc "Return all events"
        get "/" do
          {
            status: :success,
            data: Event.all,
            message: nil
          }
        end


        desc "Return events today"
        get "/today" do

          events_today = []
          Event.includes(:tickets, :galleries).each do |event|
            if event.tickets.where(from_to: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day).present?
              events_today.push([event, event.tickets, event.galleries])
            end
          end

          { status: :success, data: events_today, message: nil }
        end

        desc "Return events tomorrow"
        get "/tomorrow" do

          events_tomorrow = []
          Event.includes(:tickets, :galleries).each do |event|
            if event.tickets.where(from_to: Time.zone.tomorrow.beginning_of_day..Time.zone.tomorrow.end_of_day).present?
              events_tomorrow.push([event, event.tickets, event.galleries])
            end
          end

          { status: :success, data: events_tomorrow, message: nil }
        end

        desc "Return events upcoming"
        get "/upcoming" do

          events_upcoming = []
          Event.includes(:tickets, :galleries).each do |event|
            if event.tickets.where('DATE(from_to) > ?', Time.zone.tomorrow).present?
              events_upcoming.push([event, event.tickets, event.galleries])
            end
          end

          { status: :success, data: events_upcoming, message: nil }
        end

        desc "Return events by category"
        params { requires :title, type: String, desc: "" }
        get "/category" do
          category = Category.where(name: params[:title])
          if category.present?
            { status: :success, data: category.events, message: "Successfully" }
          else
            { status: :error, data: nil, message: "We don't have events by #{params[:title]}" }
          end
        end
      end
    end
  end
end
