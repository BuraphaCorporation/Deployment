class GreetingsController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, :hello

  def hello
  end

  def content

  end
end
