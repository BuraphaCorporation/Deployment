module Client
  class BaseController < ApplicationController
    before_action :global_categories
    before_action do
      set_current_page('client')
    end

    # include WadeAlikeHelper
    layout "wadealike"
  end
end
