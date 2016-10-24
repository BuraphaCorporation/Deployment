class TemporaryController < ApplicationController
  before_action :authenticate_admin
  before_action :order, only: [:approving, :send_email]

  layout 'daydash'

  def index
    @users = User.where(role: :user).order(created_at: :desc)
  end

  def transactions
    @orders = Order.order(created_at: :desc, status: :asc)
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
    # @order.sendmail!
    OrganizerOrderWorker.perform_async(@order.id)
    UserOrderWorker.perform_async(@order.id)

    redirect_back
  end

  private
    def order
      @order = Order.find(params[:order_id])
    end

    def authenticate_admin
      not_found unless current_user && current_user.admin?
    end

    def not_found
      raise ActionController::RoutingError.new('Not Found')
    end
end
