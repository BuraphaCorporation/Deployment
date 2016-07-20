
module API
  module Mobile
    class Wishlists < Grape::API
      include API::Mobile::Defaults

      resources :wishlists do
        desc "return all wishlist by user"
        params do
          requires :user_id, type: Integer, desc: "user_id"
        end
        get '/' do
          present :wishlists, User.find(params[:user_id]).try(:wishlists)
        end
      end

      resources :wishlist do
        desc "post wishlist"
        params do
          requires :user_id, type: Integer, desc: "user_id"
          requires :event_id, type: Integer, desc: "event_id"
        end
        post '/' do
          wishlist = Wishlists.where(user_id: params[:user_id], event_id: params[:event_id]).create!

          present :status, :success
          present :data, wishlist
        end

        desc "delete wishlist"
        params do
          requires :user_id, type: Integer, desc: "user_id"
          requires :event_id, type: Integer, desc: "event_id"
        end
        delete '/' do
          wishlist = Wishlists.where(user_id: params[:user_id], event_id: params[:event_id]).destroy_all

          present :status, :success
          present :data, wishlist
        end
      end
    end
  end
end
