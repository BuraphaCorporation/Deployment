class Admin::UsersController < Admin::CoreController
  before_action :user, only: [:edit, :update, :destroy]
  before_action :order, only: [:approving, :send_email]

  def index
    @users = User.where(role: :user).order(created_at: :desc)
  end

  def transactions
    @orders = Order.order(created_at: :desc, status: :asc)
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

  def approving
    if @order.paid?
      @order.cancel!
    else
      @order.approve!
    end
    redirect_back
  end

  def send_email
    @order.send_notify!
    redirect_back
  end

private
  def order
    @order = Order.find(params[:order_id])
  end

  def user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :first_name, :last_name, :birthday, :company, :url, :interesting, :short_description, :picture)
  end
end
