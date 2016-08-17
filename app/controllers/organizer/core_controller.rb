
class Organizer::CoreController < ApplicationController
  before_action :authenticate_user!
  before_action :organizer!

  layout 'daydash'

  # @management = true
  protected
    def organizer!
      not_found unless current_user.can_organizer?
    end

    # def management!
    #   $management = true
    # end
end
