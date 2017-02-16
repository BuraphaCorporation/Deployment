module Admin
  class ProfilesController < Admin::BaseController
    before_action :authenticate_admin!, except: :show
    before_action :admin, only: :show

    def show
      @events = @organizer.events
    end

    private

    def admin
      @user = User.where.not(role: :user).find_by_username(params[:user])
      not_found if @user.blank?
    end
  end
end
