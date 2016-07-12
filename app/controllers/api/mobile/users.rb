
module API
  module Mobile
    class Users < Grape::API
      include API::Mobile::Defaults

      resources :users do
        desc "Return all users"
        get "/", root: :users do
          present :users, User.all
        end

        # desc "Return a user" do
        #   params do
        #     require :id, type: String, desc: "ID of the user"
        #   end
        #   get ":id", root: "user" do
        #     User.where(id: permitted_params[:id])
        #   end
        # end
      end
    end
  end
end
