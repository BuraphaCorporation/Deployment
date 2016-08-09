class Mobile::UserAPI < ApplicationAPI
  include Defaults::Mobile

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

      present :data, user, with: Entities::UserExpose
    end

    desc "details of user"
    params do
      requires :user_token, type: String, desc: "token of the user"
      # requires :email, type: String, desc: 'email'
      requires :first_name, type: String, desc: 'first name'
      requires :last_name, type: String, desc: 'last_name'
      requires :phone, type: String, desc: 'phone'
      requires :birthday, type: String, desc: 'birthday formatting dd/MM/YYYY'
      requires :gender, type: String, desc: 'male, female input'
    end
    put '/' do
      user = User.find_by_token(params[:user_token])
      if user.present?
        if params[:gender] == 'male' or params[:gender] == 'female'
          user.update(first_name: params[:first_name], last_name: params[:last_name], phone: params[:phone], birthday: params[:birthday], gender: params[:gender])
          present :status, :success
          present :data, user, with: Entities::UserExpose
        else
          present :status, :failure
          present :data, "gender has male or female not #{params[:gender]}"
        end
      else
        present :status, :failure
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
        User.find_by_token(params[:token]).update(password: params[:old_password])
        present :status, :success
        present :data, nil
      rescue
        present :status, :failure
        present :data, nil
      end
    end

    desc "action referal"
    params do
      requires :user_token, type: String, desc: "token of the user"
      requires :referal_code, type: String, desc: "token of the user"
    end
    post '/referal' do
      begin
        User.find_by_token(params[:token]).update(referal_code: params[:referal_code])
        present :status, :success
        present :data, nil
      rescue
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
      present :status, :success
      present :data, nil
    end

    desc "return all tickets by user"
    params do
      requires :user_token, type: String, desc: "token of the user"
    end
    get '/tickets' do
      tickets = User.find_by_token(params[:user_token]).try(:tickets)

      if tickets.present?
        present :status, :success
      else
        present :status, :failure
      end
      present :data, tickets
    end

    desc "return a ticket by user"
    params do
      requires :user_token, type: String, desc: "token of the user"
      requires :ticket_id, type: Integer, desc: "ticket id"
    end
    get '/ticket' do
      begin
        user = User.find_by_token(params[:user_token]).find(params[:ticket_id])
        present :status, :success
        present :data, user
      rescue Exception => e
        present :status, :failure
        present :data, user.present?
      end
    end

    desc "return all wishlist by user"
    params do
      requires :user_token, type: String, desc: "token of the user"
    end
    get '/wishlists' do
      wishlists = User.find_by_token(params[:user_token]).try(:wishlists)

      if wishlists.present?
        present :status, :success
      else
        present :status, :failure
      end
      present :data, wishlists
    end

    desc "post wishlist"
    params do
      requires :user_token, type: String, desc: "token of the user"
      requires :event_id, type: Integer, desc: "event_id"
    end
    post '/wishlist' do
      begin
        user = User.find_by_token(params[:user_token])
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
      rescue
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
        user = User.find_by_token(params[:user_token])
        event = Event.find(params[:event_id])
        wishlist = Wishlist.where(user_id: user.id, event_id: event.id).destroy_all
        present :status, :success
        present :data, [ wishlisted: false ]
      rescue
        present :status, :failure
        present :data, nil
      end
    end
  end
end
