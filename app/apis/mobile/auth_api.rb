class Mobile::AuthAPI < ApplicationAPI
  include Defaults::Mobile

  resources :auth do
    desc "Return a user token from signup successfully"
    params do
      requires :email,    type: String, desc: "email of the user"
      requires :password, type: String, desc: "password of the user"
    end
    post "/signup" do
      begin
        user = User.create!(email: params[:email], password: params[:password])
        present :status, :success
        present :data, user, with: Entities::AuthExpose
      rescue Exception => e
        present :status, :failure
        present :data, e
      end
    end

    desc "Return a user token from login"
    params do
      requires :email, type: String, desc: "email of the user"
      requires :password, type: String, desc: "password of the user"
    end
    post "/login" do
      begin
        user = User.where(email: params[:email])
        if user.present? and user.valid_signup?(params[:email], params[:password])
          present :status, :success
          present :data, user.first, with: Entities::AuthExpose
        else
          present :status, :failure
          present :data, []
        end
      rescue Exception => e
        present :status, :failure
        present :data, e
      end
    end

    desc "forgotpassword"
    params do
      requires :email, type: String, desc: "Email of user"
    end
    post "/forgotpassword" do
      begin
        user = User.where(email: params[:email]).present?

        present :status, :success
        present :data, user, with: Entities::AuthExpose
      rescue Exception => e
        present :status, :failure
        present :data, e
      end
    end

    desc "Return a user token from signup or login with Facebook"
    params do
      requires :facebook_access_token, type: String, desc: "Token from Facebook authenticate"
    end
    post "/facebook" do
      begin
        token = params[:facebook_access_token]
        graph = Koala::Facebook::API.new(token)
        profile = graph.get_object("me?fields=id,email,first_name,last_name,birthday,about,gender,location")
        user = User.find_by_email(profile['email'])
        if profile.present? and user.nil?
          user = User.create(
            email: profile["email"],
            password: '123456',
            first_name: profile["first_name"],
            last_name: profile["last_name"],
            birthday: profile["birthday"],
            gender: profile["gender"],
            uid: profile["id"],
            provider: 'facebook'
          )

          present :status, :success
          present :data, user, with: Entities::AuthExpose
        else
          user.update(
            first_name: profile["first_name"],
            last_name: profile["last_name"],
            birthday: profile["birthday"],
            gender: profile["gender"],
            uid: profile["id"],
            provider: 'facebook'
          )
          present :status, :success
          present :data, user, with: Entities::AuthExpose
        end
      rescue Exception => e
        present :status, :failure
        present :data, e
      end
    end
  end
end
