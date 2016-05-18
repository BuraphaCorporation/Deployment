Rails.application.routes.draw do

  devise_for :users

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
