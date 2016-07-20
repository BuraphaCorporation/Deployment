
class Admin::UsersController < Admin::CoreController

  before_action :user, only: [:edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    if @user = User.create(user_params)
      redirect_to admin_users_path, flash: { notice: "Success!" }
    else
      redirect_to admin_users_path, flash: { error: @user.errors.full_messages }
    end
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
      params.require(:user).permit(:email, :password, :first_name, :last_name, :birthday, :company, :url, :interesting, :short_description, :avatar)
    end
end
