class Admin::EventsController < Admin::PortalController

  before_action :event, only: [:edit, :update, :destroy]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    # Event.create do |event|
    #   event.name        =
    #   event.description =
    #   event.from_to     = Date.parse(params[:])
    #   event.location    = params[:location]
    #   event.latitude    =
    #   event.longitude   =
    #   event.categories  = params[:categories]
    #   event.price       = params[:price].to_i * 100
    # end
  end

  def edit

  end

  def update
    @event.update
  end

  def destroy
    @event.destroy
  end

  private
    def event
      @event = params[:id]
    end
end
