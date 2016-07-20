
module API
  module Mobile
    class Users < Grape::API
      include API::Mobile::Defaults

      resources :user do
        desc "return a user"
        params do
          requires :user_token, type: String, desc: "token of the user"
        end
        get '/' do
          user = User.where(token: params[:user_token])
          if user.present?
            { status: :success, data: user, message: nil }
          else
            { status: :error, data: nil, message: "The token is expired!" }
          end
        end
      end

      # resources :users do
      #   desc "Return all users when you have permissions"
      #   get "/" do
      #     { status: :success, data: User.all, message: nil}
      #   end
      # end
    end
  end
end
