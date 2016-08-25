# == Route Map
#
#                           Prefix Verb     URI Pattern                                       Controller#Action
#                 new_user_session GET      /auth/sign_in(.:format)                           users/sessions#new {:subdomain=>"dev"}
#                     user_session POST     /auth/sign_in(.:format)                           users/sessions#create {:subdomain=>"dev"}
#             destroy_user_session DELETE   /auth/sign_out(.:format)                          users/sessions#destroy {:subdomain=>"dev"}
# user_facebook_omniauth_authorize GET|POST /auth/facebook(.:format)                          users/omniauth_callbacks#passthru {:subdomain=>"dev"}
#  user_facebook_omniauth_callback GET|POST /auth/facebook/callback(.:format)                 users/omniauth_callbacks#facebook {:subdomain=>"dev"}
#                    user_password POST     /auth/password(.:format)                          users/passwords#create {:subdomain=>"dev"}
#                new_user_password GET      /auth/password/new(.:format)                      users/passwords#new {:subdomain=>"dev"}
#               edit_user_password GET      /auth/password/edit(.:format)                     users/passwords#edit {:subdomain=>"dev"}
#                                  PATCH    /auth/password(.:format)                          users/passwords#update {:subdomain=>"dev"}
#                                  PUT      /auth/password(.:format)                          users/passwords#update {:subdomain=>"dev"}
#         cancel_user_registration GET      /auth/cancel(.:format)                            users/registrations#cancel {:subdomain=>"dev"}
#                user_registration POST     /auth(.:format)                                   users/registrations#create {:subdomain=>"dev"}
#            new_user_registration GET      /auth/sign_up(.:format)                           users/registrations#new {:subdomain=>"dev"}
#           edit_user_registration GET      /auth/edit(.:format)                              users/registrations#edit {:subdomain=>"dev"}
#                                  PATCH    /auth(.:format)                                   users/registrations#update {:subdomain=>"dev"}
#                                  PUT      /auth(.:format)                                   users/registrations#update {:subdomain=>"dev"}
#                                  DELETE   /auth(.:format)                                   users/registrations#destroy {:subdomain=>"dev"}
#                             root GET      /                                                 client/events#index {:subdomain=>"dev"}
#                              faq GET      /faq(.:format)                                    greetings#faq {:subdomain=>"dev"}
#             terms_and_conditions GET      /terms-and-conditions(.:format)                   greetings#terms {:subdomain=>"dev"}
#                   privacy_policy GET      /privacy-policy(.:format)                         greetings#policy {:subdomain=>"dev"}
#                           rating GET      /rating(.:format)                                 greetings#rating {:subdomain=>"dev"}
#                  client_category GET      /categories/:category(.:format)                   client/events#index {:subdomain=>"dev"}
#             client_event_express GET      /events/:event_id/express(.:format)               client/events#express {:subdomain=>"dev"}
#            client_event_checkout POST     /events/:event_id/checkout(.:format)              client/events#checkout {:subdomain=>"dev"}
#                    client_events GET      /events(.:format)                                 client/events#index {:subdomain=>"dev"}
#                     client_event GET      /events/:id(.:format)                             client/events#show {:subdomain=>"dev"}
#           client_profile_tickets GET      /profile/:profile_id/tickets(.:format)            client/profile#tickets {:subdomain=>"dev"}
#            client_profile_ticket GET      /profile/:profile_id/tickets/:ticket_id(.:format) client/profile#ticket {:subdomain=>"dev"}
#          client_profile_settings GET      /profile/:profile_id/settings(.:format)           client/profile#settings {:subdomain=>"dev"}
#                                  PUT      /profile/:profile_id/settings(.:format)           client/profile#settings_update {:subdomain=>"dev"}
#   client_profile_change_password PUT      /profile/:profile_id/change_password(.:format)    client/profile#change_password {:subdomain=>"dev"}
#             client_profile_index GET      /profile(.:format)                                client/profile#index {:subdomain=>"dev"}
#                        organizer GET      /organizer(.:format)                              organizer/dashboard#index {:subdomain=>"dev"}
#                 organizer_events GET      /organizer/events(.:format)                       organizer/events#index {:subdomain=>"dev"}
#                                  POST     /organizer/events(.:format)                       organizer/events#create {:subdomain=>"dev"}
#              new_organizer_event GET      /organizer/events/new(.:format)                   organizer/events#new {:subdomain=>"dev"}
#             edit_organizer_event GET      /organizer/events/:id/edit(.:format)              organizer/events#edit {:subdomain=>"dev"}
#                  organizer_event GET      /organizer/events/:id(.:format)                   organizer/events#show {:subdomain=>"dev"}
#                                  PATCH    /organizer/events/:id(.:format)                   organizer/events#update {:subdomain=>"dev"}
#                                  PUT      /organizer/events/:id(.:format)                   organizer/events#update {:subdomain=>"dev"}
#                                  DELETE   /organizer/events/:id(.:format)                   organizer/events#destroy {:subdomain=>"dev"}
#                            admin GET      /admin(.:format)                                  admin/events#index {:subdomain=>"dev"}
#   delete_attachment_admin_events DELETE   /admin/events/:id/attachment/:media_id(.:format)  admin/events#delete_attachment {:subdomain=>"dev"}
#                     admin_events GET      /admin/events(.:format)                           admin/events#index {:subdomain=>"dev"}
#                                  POST     /admin/events(.:format)                           admin/events#create {:subdomain=>"dev"}
#                  new_admin_event GET      /admin/events/new(.:format)                       admin/events#new {:subdomain=>"dev"}
#                 edit_admin_event GET      /admin/events/:id/edit(.:format)                  admin/events#edit {:subdomain=>"dev"}
#                      admin_event GET      /admin/events/:id(.:format)                       admin/events#show {:subdomain=>"dev"}
#                                  PATCH    /admin/events/:id(.:format)                       admin/events#update {:subdomain=>"dev"}
#                                  PUT      /admin/events/:id(.:format)                       admin/events#update {:subdomain=>"dev"}
#                                  DELETE   /admin/events/:id(.:format)                       admin/events#destroy {:subdomain=>"dev"}
#                      admin_users GET      /admin/users(.:format)                            admin/users#index {:subdomain=>"dev"}
#                                  POST     /admin/users(.:format)                            admin/users#create {:subdomain=>"dev"}
#                   new_admin_user GET      /admin/users/new(.:format)                        admin/users#new {:subdomain=>"dev"}
#                  edit_admin_user GET      /admin/users/:id/edit(.:format)                   admin/users#edit {:subdomain=>"dev"}
#                       admin_user PATCH    /admin/users/:id(.:format)                        admin/users#update {:subdomain=>"dev"}
#                                  PUT      /admin/users/:id(.:format)                        admin/users#update {:subdomain=>"dev"}
#                                  DELETE   /admin/users/:id(.:format)                        admin/users#destroy {:subdomain=>"dev"}
#                       mobile_api          /                                                 MobileAPI {:subdomain=>"dev-api"}
#              grape_swagger_rails          /documentation                                    GrapeSwaggerRails::Engine {:subdomain=>"dev-api"}
#
# Routes for GrapeSwaggerRails::Engine:
#   root GET  /           grape_swagger_rails/application#index
#

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

    if App.environment.production?
      root :to => redirect('/campaign/dash-your-day')
    else
      root 'client/events#index'
    end

    get '/blog' => redirect(App.blog)
    get '/campaign/dash-your-day', to: 'greetings#campaign'
    get '/campaign/dash-your-day/terms',  to: 'greetings#campaign_terms'
    get '/faq',                    to: 'greetings#faq'
    get '/terms-and-conditions',   to: 'greetings#terms'
    get '/privacy-policy',         to: 'greetings#policy'
    get '/rating',                 to: 'greetings#rating'

    namespace :client, path: nil do
      get 'categories/:category', to: 'events#index', as: :category
      resources :events, only: [:index, :show] do
        get '/express', to: 'events#express'
        post '/checkout', to: 'events#checkout'
      end

      resources :profile, only: [:index] do
        get '/tickets', to: 'profile#tickets'
        get '/orders', to: 'profile#orders'
        get '/orders/:ticket_id/', to: 'profile#order', as: :ticket
        # get '/profile/wishlist', to: 'profile#wishlist'
        get '/settings', to: 'profile#settings'
        put '/settings', to: 'profile#settings_update'
        put '/change_password', to: 'profile#change_password'
      end
    end

    namespace :organizer do
      get '/', to: 'dashboard#index'
      # get '/settings', to: 'dashboard#settings'
      # post '/settings', to: 'dashboard#settings_update'
      # get '/logout', to: 'dashboard#logout'
      resources :events do
        # collection do
          # delete ':id/attachment/:media_id', to: 'events#delete_attachment', as: :delete_attachment
        # end
      end
      # resources :users, except: :show
    end

    # namespace :admin do
    #   get '/', to: 'events#index'
    #   resources :events do
    #     collection do
    #       delete ':id/attachment/:media_id', to: 'events#delete_attachment', as: :delete_attachment
    #     end
    #   end
    #   resources :users, except: :show
    # end
  end

  constraints(subdomain: App.api_host) do
    mount MobileAPI, at: "/"
    mount GrapeSwaggerRails::Engine, at: "/documentation"
    # scope module: 'api' do
    #   namespace :v1 do
    #     resources :users
    #     resources :events
    #   end
    # end
  end
end
