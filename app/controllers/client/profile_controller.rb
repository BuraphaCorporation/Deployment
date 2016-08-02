class Client::ProfileController < Client::CoreController

  def initialize
    super
    @current_user = {
      profile_picture: '/src/images/mockup/user.jpg',
      firstname: 'Bow',
      lastname: 'Kraivanich',
      dob: '1985-07-03',
      gender: 'female',
      email: 'bow@daydash.co',
      tel: '+66 80 4569465',
    }
  end

  def index
    redirect_to '/profile/tickets'
  end

  def tickets
    #Mockup
    @event = Event.find(5)
    @tickets = [
      { title: 'VIP',     price: 1000, quantity: 1, purchased_date: '13 June 2016', event: @event },
      { title: 'General', price: 500, quantity: 1, purchased_date: '11 June 2016', event: @event },
    ]
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
