
class Client::CoreController < ApplicationController
  include DaydashHelper
  before_action :management!

  layout "daydash"

  def index
    @events = Event.includes(:galleries)
  end

  def show
    @event = Event.last
  end

  private
    def management!
      $management = false
    end
end
