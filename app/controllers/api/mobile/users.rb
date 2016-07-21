
module API
  module Mobile
    class Users < Grape::API
      include API::Mobile::Defaults
      include API::Mobile::Entities

      resources :user do
        desc "return a user"
        params do
          requires :user_token, type: String, desc: "token of the user"
        end
        get '/' do
          user = User.find_by_token(params[:user_token])
          if user.present?
            present :status, :success
          else
            present :status, :failure
          end

          present :data, user, with: API::Mobile::Entities::UserExpose
        end

        desc "return event by tag"
        params do
          requires :user_token, type: String, desc: "token of the user"
        end
        get '/tickets' do
          tickets = User.find_by_token(params[:user_token]).tickets
          if tickets.present?
            present :status, :success
            present :data, tickets
          else
            present :status, :error
            present :data, "error"
          end
        end

        desc "return all tags"
        get '/tags' do
          present :tags, Tag.all
        end

        desc "return all wishlist by user"
        params do
          requires :user_id, type: Integer, desc: "user_id"
        end
        get '/wishlists' do
          wishlists = User.find(params[:user_id]).try(:wishlists)
          if wishlists.present?
            present :status, :success
          else
            present :status, :failure
          end
          present :data, wishlists
        end

        desc "post wishlist"
        params do
          requires :user_id, type: Integer, desc: "user_id"
          requires :event_id, type: Integer, desc: "event_id"
        end
        post '/wishlist' do
          wishlist = Wishlists.where(user_id: params[:user_id], event_id: params[:event_id]).create!

          if wishlist.present?
            present :status, :success
          else
            present :status, :failure
          end
          present :data, wishlist
        end

        desc "delete wishlist"
        params do
          requires :user_id, type: Integer, desc: "user_id"
          requires :event_id, type: Integer, desc: "event_id"
        end
        delete '/wishlist' do
          wishlist = Wishlists.where(user_id: params[:user_id], event_id: params[:event_id]).destroy_all

          if wishlist.present?
            present :status, :success
          else
            present :status, :failure
          end
          present :data, wishlist
        end
      end
    end
  end
end
