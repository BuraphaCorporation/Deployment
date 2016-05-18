Rails.application.routes.draw do

  devise_for :users
  # devise_for :users,
  #   # class_name: Users,
  #   controllers: {
  #     registrations: "registrations",
  #     sessions: ''
  #   } do
  #   get "private_customer/sign_up" => "users/registrations#new"
  #   get "private_customer/sign_in" => "users/sessions#index"
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
