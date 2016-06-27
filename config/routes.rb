Rails.application.routes.draw do

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

  # mount Daydash::API => '/'
end

# require 'api_constraints'
#
# MarketPlaceApi::Application.routes.draw do
#   # Api definition
#   namespace :api, defaults: { format: :json },
#                               constraints: { subdomain: 'api' }, path: '/'  do
#     scope module: :v1,
#               constraints: ApiConstraints.new(version: 1, default: true) do
#       # We are going to list our resources here
#     end
#   end
# end
