module Client
  class ReactController < Client::BaseController
    layout 'client'

    def index
      @app_props = Event.all
    end
  end
end
