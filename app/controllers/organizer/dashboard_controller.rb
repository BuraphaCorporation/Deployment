
class Organizer::DashboardController < Organizer::CoreController
  
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
  	redirect_to '/organizer/events/'
  end

  def settings

  end

  def settings_update

  end

  #mockup
  def logout
  	redirect_to '/';
  end
end
