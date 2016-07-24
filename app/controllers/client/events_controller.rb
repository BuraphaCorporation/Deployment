class Client::EventsController < Client::CoreController

  def index
    @events = Event.includes(:galleries)
  end

  def show
    @event = Event.find(params[:id])
  end
end
