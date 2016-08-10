
class Organizer::DashboardController < Organizer::CoreController

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
