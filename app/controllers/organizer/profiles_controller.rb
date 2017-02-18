module Organizer
  class ProfilesController < Organizer::BaseController
    before_action :authenticate_organizer!, except: [:index, :show]
    before_action :organizer, only: :show

    def index
      set_current_page('client')
      @organizer = User.organizer.first
      @organizers = User.organizer
    end

    def show
      set_current_page('client')

      @events = @organizer.events.order(uptime: :desc)

      @covers = [
        {
          image: @organizer.cover(:full),
        }
      ]
    end

    private

    def organizer
      @organizer = User.where.not(role: :user).find_by_username(params[:organizer])
      not_found if @organizer.blank?
    end
  end
end
