Rails.application.routes.draw do

  # devise_for :users
  devise_for :users,
    path: 'auth',
    # class_name: Users,
    controllers: {
      confirmations:      'users/confirmations',
      omniauth_callbacks: 'users/omniauth_callbacks',
      passwords:          'users/passwords',
      registrations:      'users/registrations',
      sessions:           'users/sessions',
      unlocks:            'users/unlocks',
    }
    # do
    # get "private_customer/sign_up" => "users/registrations#new"
    # get "private_customer/sign_in" => "users/sessions#index"
  # end

  root 'greetings#hello'

  namespace :admin do
    get '/', to: 'dashboard#index'
    resources :events, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :users, only: [:index]
  end

  namespace :organizers do
    get '/index', to: 'portal#index'
  end
end
