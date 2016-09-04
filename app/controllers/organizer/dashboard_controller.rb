class Organizer::DashboardController < Organizer::CoreController

  def index
  	redirect_to '/organizer/events'
  end
end
