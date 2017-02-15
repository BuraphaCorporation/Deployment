module V1
  class UsersAPI < ApplicationAPI
    extend Defaults::Engine
    # use Rack::JSONP

    helpers do
      params :token do
        optional :token, type: String, default: nil
      end

      params :attributes do
        optional :attributes, type: Hash, default: {}
      end
    end

    resources :user do
      desc "return a user"
      params do
        requires :user_token, type: String, desc: "token of the user"
      end
      get '/' do
        begin
          user = User.find_by_access_token(params[:user_token])
          if user.present?
            present :status, :success
          else
            present :status, :failure
          end

          present :data, user, with: Entities::UserExpose
        rescue Exception => e
          present :status, :failure
          present :data, nil
        end
      end

      desc "details of user"
      params do
        requires :user_token, type: String, desc: "token of the user"
        # requires :email, type: String, desc: 'email'
        requires :first_name, type: String, desc: 'first name'
        requires :last_name, type: String, desc: 'last_name'
        requires :phone, type: String, desc: 'phone'
        optional :birthday, type: String, desc: 'birthday formatting dd/MM/YYYY'
        optional :gender, type: String, desc: 'male, female input'
        requires :onesignal_id, type: String, desc: "token for notification"
      end
      put '/' do
        begin
          user = User.find_by_access_token(params[:user_token])
          if user.present?
            if params[:gender] == 'male' or params[:gender] == 'female'
              user.update(first_name: params[:first_name], last_name: params[:last_name], phone: params[:phone], birthday: params[:birthday], gender: params[:gender], onesignal_id: params[:onesignal_id])
              present :status, :success
              present :data, user, with: Entities::UserExpose
            else
              user.update(first_name: params[:first_name], last_name: params[:last_name], phone: params[:phone], birthday: params[:birthday], gender: params[:gender], onesignal_id: params[:onesignal_id])
              present :status, :success
              present :data, "gender has male or female not #{params[:gender]}"
            end
          else
            present :status, :failure
          end
        rescue Exception => e
          present :status, :failure
          present :data, e
        end
      end

      desc "change password"
      params do
        requires :user_token, type: String, desc: "token of the user"
        requires :old_password, type: String, desc: "old password user"
        requires :new_password, type: String, desc: "new password user"
      end
      put 'change_password' do
        begin
          User.find_by_access_token(params[:token]).update(password: params[:old_password])
          present :status, :success
          present :data, nil
        rescue Exception => e
          present :status, :failure
          present :data, nil
        end
      end

      desc "show credit-card"
      params do
        requires :user_token, type: String, desc: "token of the user"
        # requires :omise_customer_id, type: String, desc: "omise customer token"
      end
      get '/credit-card' do
        begin
          user = User.find_by_access_token(params[:user_token])

          customer = Omise::Customer.retrieve(user.omise_customer_id)
          cards = customer.cards

          present :status, :success
          present :data, cards
        rescue Exception => e
          present :status, :failure
          present :data, e
        end
      end

      # desc "user add credit-card"
      # params do
      #   requires :user_token, type: String, desc: "token of the user"
      #   requires :omise_customer_id, type: String, desc: "omise customer token"
      # end
      # put '/credit-card' do
      #   begin
      #     user = User.find_by_access_token(params[:user_token])
      #     user.update(omise_customer_id: params[:omise_customer_id])
      #     present :status, :success
      #     present :data, user, with: Entities::UserExpose
      #   rescue Exception => e
      #     present :status, :failure
      #     present :data, e
      #   end
      # end
      #
      # desc "user delete credit-card"
      # params do
      #   requires :user_token, type: String, desc: "token of the user"
      # end
      # delete '/credit-card' do
      #   begin
      #     user = User.find_by_access_token(params[:user_token])
      #     user.update(omise_customer_id: nil)
      #     present :status, :success
      #     present :data, user, with: Entities::UserExpose
      #   rescue Exception => e
      #     present :status, :failure
      #     present :data, e
      #   end
      # end

      desc "action referal"
      params do
        requires :user_token, type: String, desc: "token of the user"
        requires :referal_code, type: String, desc: "token of the user"
      end
      post '/referal' do
        begin
          User.find_by_access_token(params[:token]).update(referal_code: params[:referal_code])
          present :status, :success
          present :data, nil
        rescue Exception => e
          present :status, :failure
          present :data, nil
        end
      end

      desc "action tag"
      params do
        optional :tag, type: Array[JSON], desc: "Tag or tags."
        requires :user_token, type: String, desc: "token of the user"
      end
      post '/tag' do
        begin
          present :status, :success
          present :data, nil
        rescue Exception => e
          present :status, :failure
          present :data, e
        end
      end

      desc "return all tickets by user"
      params do
        requires :user_token, type: String, desc: "token of the user"
      end
      get '/tickets' do
        begin
          orders = User.find_by_access_token(params[:user_token]).try(:orders)

          if orders.nil?
            present :status, :success
            present :data, []
          else
            present :status, :success
            present :data, orders.order_by_event_upcoming, with: Entities::TicketExpose
          end
        rescue Exception => e
          present :status, :failure
          present :data, e
        end
      end

      desc "return a ticket by user"
      params do
        requires :user_token, type: String, desc: "token of the user"
        requires :ticket_code, type: String, desc: "ticket id"
      end
      get '/ticket' do
        begin
          ticket = User.find_by_access_token(params[:user_token]).orders.find_by_code(params[:ticket_code])

          present :status, :success
          present :data, ticket, with: Entities::TicketExpose
        rescue Exception => e
          present :status, :failure
          present :data, ticket.present?
        end
      end

      desc "return all wishlist by user"
      params do
        requires :user_token, type: String, desc: "token of the user"
      end
      get '/wishlists' do
        begin
          wishlists = User.find_by_access_token(params[:user_token]).try(:wishlists)

          if wishlists.present?
            present :status, :success
          else
            present :status, :failure
          end
          present :data, wishlists
        rescue Exception => e
          present :status, :failure
          present :data, e
        end
      end

      desc "post wishlist"
      params do
        requires :user_token, type: String, desc: "token of the user"
        requires :event_id, type: Integer, desc: "event_id"
      end
      post '/wishlist' do
        begin
          user = User.find_by_access_token(params[:user_token])
          event = Event.find(params[:event_id])

          if Wishlist.where(user_id: user.id, event_id: params[:event_id]).empty?
            wishlist = Wishlist.create(user_id: user.id, event_id: event.id)

            if wishlist.present?
              present :status, :success
            else
              present :status, :failure
            end
            present :data, wishlist
          else
            present :status, :success
            present :data, user, with: Entities::UserWishlistExpose
          end
        rescue Exception => e
          present :status, :failure
          present :data, nil
        end
      end

      desc "delete wishlist"
      params do
        requires :user_token, type: String, desc: "token of the user"
        requires :event_id, type: Integer, desc: "event_id"
      end
      delete '/wishlist' do
        begin
          user = User.find_by_access_token(params[:user_token])
          event = Event.find(params[:event_id])
          wishlist = Wishlist.where(user_id: user.id, event_id: event.id).destroy_all
          present :status, :success
          present :data, [ wishlisted: false ]
        rescue Exception => e
          present :status, :failure
          present :data, nil
        end
      end
    end
  end
end
