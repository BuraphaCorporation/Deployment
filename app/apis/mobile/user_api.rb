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

      present :data, user, with: Entities::Expose::User
    end

    desc "details of user"
    params do
      requires :user_token, type: String, desc: "token of the user"
      # requires :email, type: String, desc: 'email'
      requires :first_name, type: String, desc: 'first name'
      requires :last_name, type: String, desc: 'last_name'
      requires :phone, type: String, desc: 'phone'
      requires :birthday, type: String, desc: 'birthday'
      requires :gender, type: String, desc: 'male, female input'
    end
    put '/' do
      user = User.find_by_token(params[:user_token])
      if user.present?
        if params[:gender] == 'male' or params[:gender] == 'female'
          user.update(first_name: params[:first_name], last_name: params[:last_name], phone: params[:phone], birthday: params[:birthday], gender: params[:gender])
          present :status, :success
          present :data, user, with: Entities::Expose::User
        else
          present :status, :error
          present :data, "gender has male or female not #{params[:gender]}"
        end
      else
        present :status, :failure
      end
    end

    desc "return event by tag"
    params do
      requires :user_token, type: String, desc: "token of the user"
    end
    get '/tickets' do
      tickets = User.find_by_token(params[:user_token]).tags
      if tickets.present?
        present :status, :success
        present :data, tickets
      else
        present :status, :error
        present :data, "error"
      end
    end

    # desc "return all tags"
    # get '/tags' do
    #   present :tags, Tag.all
    # end

    desc "action tag"
    params do
      optional :tag, type: Array[JSON], desc: "Tag or tags."
      requires :user_token, type: String, desc: "token of the user"
    end
    post '/tag' do
      # { params: params.slice(:comments), declared: declared(params) }
      # binding.pry
      # present :status, 'wating'
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
