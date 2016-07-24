class ClientController < ApplicationController
  def index
  end

  def show
    @event = Event.last
  end
end
