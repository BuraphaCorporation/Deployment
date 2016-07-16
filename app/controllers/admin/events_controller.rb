class Admin::EventsController < Admin::CoreController

  before_action :event, only: [:edit, :update, :destroy]
  before_action :all_categories, only: [:new, :edit]
  before_action :all_users, only: [:new, :edit]

  def index
    @events = Event.all.includes(:user, :category)
  end

  def new
    @event = Event.new
  end

  def create
    if @event = Event.create(event_params)
      user_id = params[:event][:user].to_i.eql?(0) ? current_user.id : params[:event][:user].to_i
      @event.update(category_id: params[:event][:category].to_i, user_id: user_id)
      redirect_to admin_events_path, flash: { notice: "Success!" }
    else
      redirect_to admin_events_path, flash: { error: @event.errors.full_messages }
    end
  end

  def edit
  end

  def update
    @event.update(event_params)
    redirect_to :back
  end

  def destroy
    @event.destroy
  end

  def upload
    uploaded_io = params[:file]
    event = params[:event_id]

    EventAttachment.create(event_id: event.to_i, media: uploaded_io)
    # File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
    #   file.write(uploaded_io.read)
    # end

  end

  private
    def event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:title, :description, :price, :cover, :location, :from_to)
    end

    def all_categories
      @categories = Category.all
    end

    def all_users
      @users = Role.find_by_name('organizer').users
    end
end
