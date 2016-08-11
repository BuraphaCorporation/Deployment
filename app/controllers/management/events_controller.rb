class Management::EventsController < Management::CoreController

  before_action :event, only: [:edit, :update, :destroy, :delete_attachment]
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
      serialize_data_create

      redirect_to edit_management_event_path(@event.id), flash: { notice: "Success!" }
    else
      redirect_to management_events_path, flash: { error: @event.errors.full_messages }
    end
  end

  def edit
    @category_id = @event.categories.pluck(:id)
  end

  def update
    @event.update(event_params)
    serialize_data_update
    redirect_to :back
  end

  def destroy
    @event.destroy
  end

  def delete_attachment
    @event.galleries.where(id: params[:media_id]).destroy_all
    redirect_to :back
  end

  private

    def serialize_data_create
      user_id = params[:event][:user].to_i.eql?(0) ? current_user.id : params[:event][:user].to_i
      @event.update(user_id: user_id)

      params[:event][:category_ids].each do |category|
        CategoriesEvent.create(category_id: category, event_id: @event.id) if category.present?
      end unless params[:event][:category_ids].nil?

      params[:event][:attachments].each do |attachment|
        Gallery.create(event: @event, media: attachment)
      end unless params[:event][:attachments].nil?

      params[:event][:sections_attributes].each do |section|
        event_time = DateTime.parse("#{params[:event][:sections_attributes][section][:section_event_date].first} #{params[:event][:sections_attributes][section][:section_event_time].first}")
        end_time   = DateTime.parse("#{params[:event][:sections_attributes][section][:section_end_date].first} #{params[:event][:sections_attributes][section][:section_end_time].first}")

        Section.create do |s|
          s.event_id    = @event.id
          s.title       = params[:event][:sections_attributes][section][:section_name].first
          s.available   = params[:event][:sections_attributes][section][:section_available].first
          s.price       = params[:event][:sections_attributes][section][:section_price].first
          s.event_time  = event_time
          s.end_time    = end_time
        end
      end unless params[:event][:sections_attributes].nil?
    end

    def serialize_data_update
      category = params[:event][:category].reject { |c| c.empty? }
      CategoriesEvent.where(event: @event).where.not(category: category).delete_all
      params[:event][:category].each do |category|
        CategoriesEvent.create(category_id: category, event_id: @event.id) if category.present?
      end unless params[:event][:category].nil?

      params[:event][:attachments].each do |attachment|
        Gallery.create(event: @event, media: attachment)
      end unless params[:event][:attachments].nil?
    end

    def event
      @event = Event.friendly.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:title, :description, :location, :latitude, :longitude, section_attributes: [:section_name, :section_available, :section_price, :_destroy])
    end

    def all_categories
      @categories = Category.all
    end

    def all_users
      # @users = Role.find_by_title('organizer').users
    end
end
