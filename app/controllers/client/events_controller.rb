class Client::EventsController < Client::CoreController

  def index
    @events = Event.includes(:galleries)
  end

  def show
    @event = Event.find(params[:id])
  end

  def payment
    @event = Event.find(params[:event_id])
  end
end
