class Mobile::AuthAPI < ApplicationAPI
  # include Entities::Expose

  resources :auth do
    desc "Return a user token from signup successfully"
    params do
      requires :email,    type: String, desc: "email of the user"
      requires :password, type: String, desc: "password of the user"
    end
    post "/signup" do #, root: "user" do
      user = User.where(email: params[:email])
      if user.exists?
        present :status, :failure
        present :data, nil
      else
        user = User.create!(email: params[:email], password: params[:password])
        present :status, :success
        present :data, user.token
      end
    end

    desc "Return a user token from login"
    params do
      requires :email, type: String, desc: "email of the user"
      requires :password, type: String, desc: "password of the user"
    end
    post "/login" do
      user = User.where(email: params[:email])
      if user.present? and user.valid_signup?(params[:email], params[:password])
        present :status, :success
        present :data, user.first.token
      else
        present :status, :failure
        present :data, []
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

      if profile.present?

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

        present :status, :success
        present :data, user.token
      else
        present :status, :failure
        present :data, ""
      end
    end
  end
end
