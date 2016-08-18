class Organizer::CoreController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_organizer!

  layout 'daydash'

  protected
    def authenticate_organizer!
      not_found unless current_user && current_user.can_organizer?
    end
end
