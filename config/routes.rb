Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

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

  root 'client/core#index'
  # namespace :client

  namespace :management do
    get '/', to: 'events#index'
    resources :events do
      collection do
        delete ':id/attachment/:media_id', to: 'events#delete_attachment', as: :delete_attachment
      end
    end
    resources :users, except: :show
  end

  if ['production', 'staging'].include?(App.environment)
    constraints subdomain: 'api' do
      mount API::Base, at: "/"
      mount GrapeSwaggerRails::Engine, at: "/documentation"
    end
  else
    constraints subdomain: 'dev-api' do
      mount API::Base, at: "/"
      mount GrapeSwaggerRails::Engine, at: "/documentation"
      # scope module: 'api' do
      #   namespace :v1 do
      #     resources :users
      #     resources :events
      #   end
      # end
    end
  end
end
