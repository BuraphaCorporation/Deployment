
class Management::CoreController < ApplicationController
  include DaydashHelper
  before_action :authenticate_user!
  before_action :management!

  layout 'daydash'

  @management = true

  def index
  end

  private
    def management!
      $management = true
    end
end
