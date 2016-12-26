module Client
  class EventsController < Client::BaseController
    before_action :related_events, only: :show

    def index
      if params[:category].present?
        @category_id = Category.friendly.find(params[:category]).id
      else
        @category_id = nil
      end
      @events = Event.list
    end

    def show
      @event    = Event.where('lower(slug) = ?', params[:id].downcase).first
      @section_count = @event.sections.count

      @sections = @event.ticket_type.deal? ? @event.sections : @event.sections.available

      @section  = @event.sections.min_by { |m| m.price }

      set_seo_title @event.try(:title)
      set_meta_tags description: @event.try(:short_description),
      og: {
        title:          @event.try(:title),
        image: {
            _:          @event.social_share.present? ? @event.try(:social_share, :facebook) : @event.event_pictures.try(:first).try(:media, :facebook),
            url:        @event.social_share.present? ? @event.try(:social_share, :facebook) : @event.event_pictures.try(:first).try(:media, :facebook),
            width:      1200,
            height:     630,
          },
        latitude:       @event.try(:latitude),
        longitude:      @event.try(:longitude),
        email:          @event.try(:email),
        phone:          @event.try(:phone),
        street_address: @event.try(:location_address),
        location:       @event.try(:location_name),
        start_time:     @event.try(:uptime),
        end_time:       @event.try(:uptime),
      },
      twitter: {
        title:            @event.try(:title),
        image: {
          _:              @event.social_share.present? ? @event.try(:social_share, :facebook) : @event.event_pictures.try(:first).try(:media, :facebook),
          url:            @event.social_share.present? ? @event.try(:social_share, :facebook) : @event.event_pictures.try(:first).try(:media, :facebook),
          width:          1200,
          height:         630,
        },
        card:             'summary_large_image'
      }
    end

    private

    def related_events
      @related_events = Event.where.not(slug: params[:id]).list.first(3)
    end
  end
end
