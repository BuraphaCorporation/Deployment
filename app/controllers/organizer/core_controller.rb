class Organizer::CoreController < ApplicationController
  before_action :authenticate_organizer!

  include OrganizerHelper
  include DaydashHelper

  layout 'daydash'

protected
  def authenticate_organizer!
    not_found unless current_user && current_user.can_organizer?
  end
end
