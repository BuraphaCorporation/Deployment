class Admin::CoreController < ApplicationController
  before_action :authenticate_user!

  layout 'management'

  def index
  end
end
