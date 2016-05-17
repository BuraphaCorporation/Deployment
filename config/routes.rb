Rails.application.routes.draw do

  devise_for :users

  root 'greetings#hello'

  namespace :admin do
    # get '/', to: 'portal#index'
    get '/event', to: 'event#index'
    get '/dashboard', to: 'dashboard#index'
  end

  namespace :organizers do
    get '/index', to: 'portal#index'
  end
end
