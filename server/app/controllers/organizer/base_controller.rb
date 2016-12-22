module Organizer
  class BaseController < ApplicationController
    before_action :authenticate_organizer!
    before_action :global_categories
    before_action do
      set_current_page('organizer')
    end

    include OrganizerHelper
    include DaydashHelper

    layout 'daydash'

  protected
    def authenticate_organizer!
      not_found unless current_user && current_user.can_organizer?
    end

    def admin_only
      current_user.admin?
    end
  end
end
