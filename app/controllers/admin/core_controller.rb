class Admin::CoreController < ApplicationController
  before_action :authenticate_admin!

  include AdminHelper
  include DaydashHelper

  layout 'daydash'

  protected
  def authenticate_admin!
    not_found unless current_user && current_user.admin?
  end
end
