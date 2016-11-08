module Client
  class ProfileController < Client::BaseController
    before_action :authenticate_user!

    def index
      redirect_to '/profile/tickets'
    end

    def tickets
      set_seo_title 'Profile'

      @ticket = current_user.tickets.where.not(status: :unusable)
      @tickets_active = @ticket.active
      @tickets_passed = @ticket.passed
      @has_tickets_passed = @tickets_passed.present?
    end

    def orders
      set_seo_title 'Orders'

      @data       = current_user.orders.includes(:tickets)
      @orders       = @data.has_payments.order(id: :desc)
      @has_tickets  = @orders.present?
    end

    def order
      set_seo_title 'Order'

      begin
        @payment = current_user.orders.find(params[:ticket_id])
        @tickets = @payment.tickets
      rescue
        redirect_to client_profile_tickets_path
      end
    end

    def wishlist
      set_seo_title 'Wishlist'

      @events = Event.all
    end

    def settings
      set_seo_title 'Setting'

      @user = current_user
    end

    def settings_update
      p user_params
      current_user.update(user_params)
      redirect_to :back
    end

    def change_password
      if check_password
        current_user.update(password: params[:user][:new_password])
        message = "update password successfully"
      else
        message = "update password failure"
      end
      redirect_to :back, notice: message
    end

    #Mockup Auth System
    def login
      redirect_to '/profile'
    end

    def logout
      redirect_to '/'
    end

  private
    def user_params
      if params[:dob_date].present? and params[:dob_month].present? and params[:dob_year].present?
        params[:user][:birthday] = Date.strptime("#{params[:dob_date]}/#{params[:dob_month]}/#{params[:dob_year]}", "%d/%m/%Y")
      end
      params.require(:user).permit(:email, :first_name, :last_name, :gender, :birthday, :phone, :company, :url, :facebook, :twitter, :instagram, :youtube, :short_description, :picture, :latitude, :longitude)
    end

    def check_password
      current_user.valid_password?(params[:user][:current_password]) && (params[:user][:new_password] == params[:user][:new_password_confirm])
    end
  end
end
