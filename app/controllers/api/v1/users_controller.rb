
module Api::V1
  class UsersController < ApiController

    def index
      render json: User.all
    end
  end
end
