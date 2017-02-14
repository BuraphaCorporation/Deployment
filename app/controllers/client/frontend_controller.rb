module Client
  class FrontendController < ApplicationController
    layout 'client'

    def index
      @app_props = Event.all
    end
  end
end
