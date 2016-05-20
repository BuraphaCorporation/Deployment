class Admin::UsersController < Admin::PortalController

  before_action :user, only: [:edit, :update, :destroy]

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
    @user.update(user_params)
    redirect_to :back
  end

  def destroy
    @user.destroy
  end

  private
    def user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :birthday, :company, :url, :interesting, :short_description, :avatar)
    end
end
