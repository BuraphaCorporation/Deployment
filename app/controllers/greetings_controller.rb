class GreetingsController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: :hello

  def hello

  end

  def events
    Event.last(6)
  end
end
