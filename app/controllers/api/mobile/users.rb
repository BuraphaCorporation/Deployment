
module API
  module Mobile
    class Users < Grape::API
      include API::Mobile::Defaults

      resources :users do
        # desc "Return all users when you have permissions"
        # get "/", root: :users do
        #   present :users, User.all
        # end
        desc "return a user"
        params do
          requires :token, type: String, desc: "token of the user"
        end
        post '/' do
          # binding.pry
          user = User.where(id: params[:token])
          if user.present?
            { status: :success, message: user }
          else
            { status: :error, message: "The token is expired!" }
          end
        end
      end
    end
  end
end
