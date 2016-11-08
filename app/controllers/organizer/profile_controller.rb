module Organizer
  class ProfileController < Organizer::BaseController
    before_action :authenticate_organizer!, except: :show
    before_action :organizer, only: :show

    def show
      @events = @organizer.events
    end

    private
      def organizer
        @organizer = User.where.not(role: :user).find_by_username(params[:organizer])
        not_found if @organizer.blank?
      end
  end
end
