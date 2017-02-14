
Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  constraints(subdomain: App.host('api')) do
    mount Sidekiq::Web => '/workers'
    # mount ActionCable.server => "/cable"

    mount ApplicationAPI, at: '/'
    mount GrapeSwaggerRails::Engine, at: '/explorer'
  end

  constraints(subdomain: App.host)  do
    devise_for :user,
      path: 'auth',
      controllers: {
        confirmations:      'user/confirmations',
        omniauth_callbacks: 'user/omniauth_callbacks',
        passwords:          'user/passwords',
        registrations:      'user/registrations',
        sessions:           'user/sessions',
        unlocks:            'user/unlocks',
      }

    root 'client/frontend#index'

    namespace :admin do
      get '/',                      to: 'dashboard#index'
      resources :events
      resources :transactions
      resources :users
    end
  end
end
