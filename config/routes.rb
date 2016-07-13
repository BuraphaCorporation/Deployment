Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  constraints subdomain: 'api' do
    mount API::Base, at: "/api"
    mount GrapeSwaggerRails::Engine, at: "/documentation"
    # scope module: 'api' do
    #   namespace :v1 do
    #     resources :users
    #     resources :events
    #   end
    # end
  end


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

  root 'greetings#hello'
  get '/events', to: 'greetings#events'

  namespace :admin do
    get '/', to: 'dashboard#index'
    resources :events
    resources :users, except: :show
  end

  namespace :organizers do
    get '/index', to: 'portal#index'
  end
end
