module Admin
  class TemporaryController < Admin::BaseController
    before_action :authenticate_admin
    before_action :order, only: [:approving, :send_email]
    # http_basic_authenticate_with name: 'admin', password: 'x'
    layout 'thekanko'

    def index
      @organizer = User.where(role: :organizer).order(created_at: :desc)
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
      Workers::OrganizerOrderWorker.perform_async(@order.id)
      Workers::UserOrderWorker.perform_async(@order.id)

      redirect_back
    end

    def login
      # bhf checks for this session in a before_filter, if it's true user will pass
      session[:is_admin] = true
      redirect_to x.root_url
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
end