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
  get '/content', to: 'greetings#content'

  resources :admin do
    get '/', to: 'dashboard#index'
    resources :events
    resources :users, except: :show
  end

  resources :organizers do
    get '/index', to: 'portal#index'
  end

end
