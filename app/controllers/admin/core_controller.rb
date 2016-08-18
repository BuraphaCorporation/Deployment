class Admin::CoreController < ApplicationController
  include DaydashHelper
  before_action :authenticate_user!
  before_action :authenticate_admin!

  layout 'daydash'

  private
    def authenticate_admin!
      not_found unless current_user && current_user.is_admin?
    end
end
