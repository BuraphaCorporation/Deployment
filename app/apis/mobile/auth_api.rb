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
        present :data, user
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

        user = User.from_api(token)

        present :status, :success
        present :data, user, with: Entities::AuthExpose
      rescue Exception => e
        present :status, :failure
        present :data, e
      end
    end
  end
end
