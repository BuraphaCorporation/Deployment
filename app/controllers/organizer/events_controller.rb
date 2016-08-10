
class Organizer::EventsController < Organizer::CoreController

  before_action :event, only: [:edit, :update, :destroy, :delete_attachment]
  before_action :all_categories, only: [:new, :edit]
  before_action :all_users, only: [:new, :edit]


  def index
    @events = Event.all
  end

  def new
    @event = Event.new
    @categories = Category.all
  end

  def create
    if @event = Event.create(event_params)
      serialize_data_create

      redirect_to edit_organizer_event_path(@event.to_url), flash: { notice: "Success!" }
    else
      redirect_to organizer_events_path, flash: { error: @event.errors.full_messages }
    end
  end

  def show
    @event = Event.friendly.find(params[:id])

    @payments = [
      { purchased_at: '2016-08-01 08:12:33', user: current_user, quantity: 2, type: 'general', total: 2500 },
      { purchased_at: '2016-08-01 08:12:33', user: current_user, quantity: 1, type: 'VIP', total: 2500 },
      { purchased_at: '2016-08-01 08:12:33', user: current_user, quantity: 2, type: 'general', total: 2500 },
      { purchased_at: '2016-08-01 08:12:33', user: current_user, quantity: 2, type: 'general', total: 2500 },
    ]
  end

  def edit
    @event = Event.friendly.find(params[:id])
    @categories = Category.all

    @sections = [
      { id: 1, title: 'General', available: 20, price: 500, date: '03/08/2016', start_time: '13:00', end_time: '15:00' },
      { id: 2, title: 'VIP',     available:  5, price: 500, date: '03/08/2016', start_time: '13:00', end_time: '15:00' },
      { id: 3, title: 'General', available: 15, price: 500, date: '04/08/2016', start_time: '13:00', end_time: '15:00' },
    ]

    @images = [
      { id: 1, url: '/src/images/content/cover-1.jpg' },
      { id: 2, url: '/src/images/content/cover-2.jpg' },
      { id: 3, url: '/src/images/content/cover-1.jpg' },
      { id: 4, url: '/src/images/content/cover-2.jpg' },
      { id: 5, url: '/src/images/content/cover-1.jpg' },
      { id: 6, url: '/src/images/content/cover-2.jpg' },
    ]
    @images_order = [];
    @images.each do |image|
      @images_order.push(image[:id])
    end
    # @category_id = @event.categories.pluck(:id)
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

      user_id = params[:user].to_i.eql?(0) ? current_user.id : params[:user].to_i
      @event.update(user_id: user_id)

      params[:category_ids].each do |category|
        CategoriesEvent.create(category_id: category, event_id: @event.id) if category.present?
      end unless params[:category_ids].nil?

      params[:attachments].each do |attachments|
        Gallery.create(event: @event, media: attachments)
      end unless params[:attachments].nil?

      params[:sections_attributes].each do |section|
        event_time = DateTime.parse("#{params[:sections_attributes][section][:section_event_date].first} #{params[:sections_attributes][section][:section_event_time].first}")
        end_time   = DateTime.parse("#{params[:sections_attributes][section][:section_end_date].first} #{params[:sections_attributes][section][:section_end_time].first}")

        Section.create do |s|
          s.event_id    = @event.id
          s.title       = params[:sections_attributes][section][:section_name].first
          s.available   = params[:sections_attributes][section][:section_available].first
          s.price       = params[:sections_attributes][section][:section_price].first
          s.event_time  = event_time
          s.end_time    = end_time
        end
      end unless params[:sections_attributes].nil?
    end

    def serialize_data_update
      category = params[:category].reject { |c| c.empty? }
      CategoriesEvent.where(event: @event).where.not(category: category).delete_all
      params[:category].each do |category|
        CategoriesEvent.create(category_id: category, event_id: @event.id) if category.present?
      end unless params[:category].nil?

      params[:attachments].each do |attachments|
        Gallery.create(event: @event, media: attachments)
      end unless params[:attachments].nil?
    end

    def event
      @event = Event.friendly.find(params[:id])
    end

    def event_params
      params.permit(:title, :description, :location, :latitude, :longitude, section_attributes: [:section_name, :section_available, :section_price, :_destroy])
    end

    def all_categories
      @categories = Category.all
    end

    def all_users
      # @users = Role.find_by_title('organizer').users
    end
end
