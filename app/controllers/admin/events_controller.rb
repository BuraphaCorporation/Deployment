
class Admin::EventsController < Admin::CoreController

  before_action :event, only: [:edit, :update, :destroy]
  before_action :all_categories, only: [:new, :edit]
  before_action :all_users, only: [:new, :edit]

  def index
    @events = Event.all.includes(:user, :category).order(created_at: :desc)
  end

  def new
    @event = Event.new
  end

  def create
    if @event = Event.create(event_params)
      serialize_data

      redirect_to edit_admin_event_path(@event.id), flash: { notice: "Success!" }
    else
      redirect_to admin_events_path, flash: { error: @event.errors.full_messages }
    end
  end

  def edit
  end

  def update
    @event.update(event_params)
    serialize_data
    redirect_to :back
  end

  def destroy
    @event.destroy
  end

  private

    def serialize_data
      user_id = params[:event][:user].to_i.eql?(0) ? current_user.id : params[:event][:user].to_i
      @event.update(user_id: user_id)

      params[:event][:category].each do |category|
        CategoriesEvent.create(category_id: category, event_id: @event.id) if category.present?
      end

      params[:event][:attachments].each do |attachments|
        Gallery.create(event_id: @event.id, media: attachments)
      end
      binding.pry

      # params[:event][:sections_attributes].first.second[:section_name]

      # params[:event][:sections_attributes].each do |section|
      #   p section.first
      # end

      #   event_time = DateTime.parse("#{section.second[:section_event_date].first} #{section.second[:section_event_time].first}")
      #   end_time   = DateTime.parse("#{section.second[:section_end_date].first} #{section.second[:section_end_time].first}")

      #   Section.create do |s|
      #     s.event_id    = @event.id
      #     s.title       = section.second[:section_name]
      #     s.avaliable   = section.second[:section_avaliable]
      #     s.price       = section.second[:section_price]
      #     s.event_time  = event_time
      #     s.end_time    = end_time
      #   end
      # end
    end

    def event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:title, :description, :location, :latitude, :longitude, section_attributes: [:section_name, :section_avaliable, :section_price, :_destroy])
    end

    def all_categories
      @categories = Category.all
    end

    def all_users
      @users = Role.find_by_name('organizer').users
    end
end
