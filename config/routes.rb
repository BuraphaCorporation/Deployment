
Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  constraints(subdomain: App.host)  do
    devise_for :users,
      path: 'auth',
      controllers: {
        confirmations:      'users/confirmations',
        omniauth_callbacks: 'users/omniauth_callbacks',
        passwords:          'users/passwords',
        registrations:      'users/registrations',
        sessions:           'users/sessions',
        unlocks:            'users/unlocks',
      }

    root 'client/events#index'

    get 'faq',                  to: 'greetings#faq'
    get 'terms-and-conditions', to: 'greetings#terms'
    get 'privacy-policy',       to: 'greetings#policy'
    get 'rating',               to: 'greetings#rating'

    namespace :client, path: nil do
      get 'categories/:category', to: 'events#index', as: :category
      resources :events, only: [:index, :show] do
        get '/express', to: 'events#express'
        post '/checkout', to: 'events#checkout'
      end

      resources :profile, only: [:index] do
        get '/tickets', to: 'profile#tickets'
        get '/tickets/:ticket_id/', to: 'profile#ticket', as: :ticket
        # get '/profile/wishlist', to: 'profile#wishlist'
        get '/settings', to: 'profile#settings'
        put '/settings', to: 'profile#settings_update'
        put '/change_password', to: 'profile#change_password'
      end
    end

    namespace :organizer do
      get '/', to: 'dashboard#index'
      # get '/settings', to: 'dashboard#settings'
      # post '/settings', to: 'dashboard#settings_update'
      get '/logout', to: 'dashboard#logout'
      resources :events do
        # collection do
          # delete ':id/attachment/:media_id', to: 'events#delete_attachment', as: :delete_attachment
        # end
      end
      # resources :users, except: :show
    end

    # namespace :admin do
    #   get '/', to: 'events#index'
    #   resources :events do
    #     collection do
    #       delete ':id/attachment/:media_id', to: 'events#delete_attachment', as: :delete_attachment
    #     end
    #   end
    #   resources :users, except: :show
    # end
  end

  constraints(subdomain: App.api_host) do
    mount MobileAPI, at: "/"
    mount GrapeSwaggerRails::Engine, at: "/documentation"
    # scope module: 'api' do
    #   namespace :v1 do
    #     resources :users
    #     resources :events
    #   end
    # end
  end
end
