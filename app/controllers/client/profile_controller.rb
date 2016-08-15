class Client::ProfileController < Client::CoreController
  before_action :authenticate_user!

  def index
    redirect_to '/profile/tickets'
  end

  def tickets
    @tickets = current_user.payments
    @has_tickets = @tickets.present?
  end

  def ticket
    begin
      @payment = current_user.payments.find(params[:ticket_id])
      @tickets = @payment.tickets
    rescue
      redirect_to client_profile_tickets_path
    end
  end

  def wishlist
    @events = Event.all
  end

  def settings
    @user = current_user
  end

  def settings_update
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
      params.require(:user).permit(:email, :first_name, :last_name, :gender, :birthday, :phone)
    end

    def check_password
      current_user.valid_password?(params[:user][:current_password]) && (params[:user][:new_password] == params[:user][:new_password_confirm])
    end
end
