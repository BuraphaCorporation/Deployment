class Admin::EventsController < Admin::PortalController

  before_action :event, only: [:edit, :update, :destroy]
  before_action :all_categories, only: [:new, :edit]

  def index
    @events = Event.all.includes(:user, :category)
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

    def all_categories
      @categories = Category.all
    end
end
