module Client
  class BaseController < ApplicationController
    before_action :global_categories
    
    include DaydashHelper
    layout "daydash"
  end
end