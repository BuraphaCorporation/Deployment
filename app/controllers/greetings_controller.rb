class GreetingsController < ApplicationController
  before_action :authenticate_user!

  def hello
    @user = current_user
  end
end
