
module API
  module Mobile
    class Authentication < Grape::API
      include API::Mobile::Defaults

      resources :auth do
        desc "Return a user token from signup successfully"
        params do
          requires :email,    type: String, desc: "email of the user"
          requires :password, type: String, desc: "password of the user"
        end
        post "/signup" do #, root: "user" do
          if User.where(email: params[:email]).present?
            { status: :failure, data: nil, message: "we have that email in our system"}
          else
            user = User.create!(email: params[:email], password: params[:password])
            { status: :success, data: user.token, message: nil }
          end
        end

        desc "Return a user token from login"
        params do
          requires :email, type: String, desc: "email of the user"
          requires :password, type: String, desc: "password of the user"
        end
        post "/login" do
          user = User.find_by_email(params[:email])
          if user.present? and user.valid_password?(params[:password])
            { status: :success, data: user.token, message: nil }
          else
            { status: :error, data: nil, message: "Wrong input! or not match in database" }
          end
        end

        desc "Return a user token from signup or login with Facebook"
        params do
          requires :facebook_access_token, type: String, desc: "Token from Facebook authenticate"
        end
        post "/facebook" do
          token = params[:facebook_access_token]
          graph = Koala::Facebook::API.new(token)
          profile = graph.get_object("me?fields=id,email,first_name,last_name,birthday,about,gender,location")

          unless profile.nil?
            user = User.where(email: profile['email']).first_or_create do |u|
              u.email       = profile["email"]
              u.password    = '123456'
              u.first_name  = profile["first_name"]
              u.last_name   = profile["last_name"]
              u.birthday    = profile["birthday"]
              u.gender      = profile["gender"]
              u.uid         = profile["id"]
              u.provider    = 'facebook'
            end

            { user_token: user.token }
          end
        end
      end
    end
  end
end
