class Client::ProfileController < Client::CoreController

  def index
    redirect_to '/profile/tickets'
  end

  def tickets
    @tickets = current_user.tickets
    @has_ticket = @tickets.present?
  end

  def ticket
    @ticket = { title: 'VIP',     price: 1000, quantity: 1 }

  end

  def wishlist
    @events = Event.all
  end

  def settings

  end

  def settings_update

  end

  #Mockup Auth System
  def login
    redirect_to '/profile'
  end

  def logout
    redirect_to '/'
  end

end
