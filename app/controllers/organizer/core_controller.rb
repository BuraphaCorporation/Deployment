
class Organizer::CoreController < ApplicationController
  before_action :organizer!

  layout 'daydash'

  @management = true

  protected
    def organizer!
      binding.pry
      current_user.can_organizer?
    end

    def management!
      $management = true
    end
end
