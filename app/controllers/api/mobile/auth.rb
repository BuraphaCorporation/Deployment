
module API
  module Mobile
    class Auth < Grape::API
      include API::Mobile::Defaults

      resources :auth do
        desc "Return a user token from signup successfully"
        params do
          requires :email,    type: String, desc: "email of the user"
          requires :password, type: String, desc: "password of the user"
        end
        post "/signup" do #, root: "user" do
          User.where(email: params[:email], password: params[:password])
        end

        desc "Return a user token from login"
        params do
          requires :email, type: String, desc: "email of the user"
          requires :password, type: String, desc: "password of the user"
        end
        post "/login" do
          user = User.where(email: params[:email])
          if user.present?
            if user.valid_password?(params[:password])
              { status: :success, message: user }
            else
              { status: :error, message: "Wrong input! or not match in database" }
            end
          else
            { status: :error, message: "Wrong input! or not match in database" }
          end
        end

        desc "Return a user token from signup or login with Facebook"
        params do
          requires :fb_token, type: String, desc: "Token from Facebook authenticate"
        end
        post "/facebook" do
          token = params[:fb_token]
          graph = Koala::Facebook::API.new(token)

          profile = graph.get_object("me?fields=id,name,birthday,about,last_name,first_name,gender,location")

        end
      end
    end
  end
end
