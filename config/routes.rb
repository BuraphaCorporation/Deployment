
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
    namespace :client, path: '' do
      resources :events, only: [:index, :show] do
        get '/payment', to: 'events#payment'
        post '/checkout', to: 'events#checkout'
      end
      # resources :payment, only: [:index, :show, :create, :new]
    end

    namespace :management do
      get '/', to: 'events#index'
      resources :events do
        collection do
          delete ':id/attachment/:media_id', to: 'events#delete_attachment', as: :delete_attachment
        end
      end
      resources :users, except: :show
    end
  end

  constraints(subdomain: App.api_host) do
    mount API, at: "/"
    mount GrapeSwaggerRails::Engine, at: "/documentation"
    # scope module: 'api' do
    #   namespace :v1 do
    #     resources :users
    #     resources :events
    #   end
    # end
  end
end
