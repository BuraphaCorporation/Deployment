
class Organizer::CoreController < ApplicationController

  layout 'daydash'

  @management = true

  def index
  	
  end

  private
    def management!
      $management = true
    end
end
