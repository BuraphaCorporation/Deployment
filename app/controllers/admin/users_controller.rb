class Admin::UsersController < Admin::PortalController

  before_action :event, only: [:edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
  end

  def create

  end

  def edit

  end

  def update
  end

  def destroy
    @user.destroy
  end

  private
    def event
      @user = params[:id]
    end
end
