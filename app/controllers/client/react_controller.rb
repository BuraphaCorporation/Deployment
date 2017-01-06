module Client
  class ReactController < Client::BaseController
    before_action :authenticate_user!

    layout 'client'

    def index
      @app_props = Event.all
    end
  end
end
