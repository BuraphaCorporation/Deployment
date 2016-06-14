
module Daydash
  class Event < Grape::API
    desc  'Event all'
    get :events do
      { events: Event.all }
    end
    # helplers do
    #   def current_user
    #     @current_user ||= User.authorize!(env)
    #   end

    #   def authenticate!
    #     error!('401 Unauthorized', 401) unless current_user
    #   end
    # end
  end
end
