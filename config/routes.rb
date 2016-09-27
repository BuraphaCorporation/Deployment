# == Route Map
#
#                           Prefix Verb     URI Pattern                                              Controller#Action
#                 errors_not_found GET      /errors/not_found(.:format)                              errors#not_found
#     errors_internal_server_error GET      /errors/internal_server_error(.:format)                  errors#internal_server_error
#                                           /404(.:format)                                           errors#not_found
#                                           /500(.:format)                                           errors#internal_server_error
#                      sidekiq_web          /workers                                                 Sidekiq::Web {:subdomain=>"dev"}
#                 new_user_session GET      /auth/sign_in(.:format)                                  users/sessions#new {:subdomain=>"dev"}
#                     user_session POST     /auth/sign_in(.:format)                                  users/sessions#create {:subdomain=>"dev"}
#             destroy_user_session DELETE   /auth/sign_out(.:format)                                 users/sessions#destroy {:subdomain=>"dev"}
# user_facebook_omniauth_authorize GET|POST /auth/facebook(.:format)                                 users/omniauth_callbacks#passthru {:subdomain=>"dev"}
#  user_facebook_omniauth_callback GET|POST /auth/facebook/callback(.:format)                        users/omniauth_callbacks#facebook {:subdomain=>"dev"}
#                    user_password POST     /auth/password(.:format)                                 users/passwords#create {:subdomain=>"dev"}
#                new_user_password GET      /auth/password/new(.:format)                             users/passwords#new {:subdomain=>"dev"}
#               edit_user_password GET      /auth/password/edit(.:format)                            users/passwords#edit {:subdomain=>"dev"}
#                                  PATCH    /auth/password(.:format)                                 users/passwords#update {:subdomain=>"dev"}
#                                  PUT      /auth/password(.:format)                                 users/passwords#update {:subdomain=>"dev"}
#         cancel_user_registration GET      /auth/cancel(.:format)                                   users/registrations#cancel {:subdomain=>"dev"}
#                user_registration POST     /auth(.:format)                                          users/registrations#create {:subdomain=>"dev"}
#            new_user_registration GET      /auth/sign_up(.:format)                                  users/registrations#new {:subdomain=>"dev"}
#           edit_user_registration GET      /auth/edit(.:format)                                     users/registrations#edit {:subdomain=>"dev"}
#                                  PATCH    /auth(.:format)                                          users/registrations#update {:subdomain=>"dev"}
#                                  PUT      /auth(.:format)                                          users/registrations#update {:subdomain=>"dev"}
#                                  DELETE   /auth(.:format)                                          users/registrations#destroy {:subdomain=>"dev"}
#                             root GET      /                                                        client/events#index {:subdomain=>"dev"}
#                        react_api GET      /react-api(.:format)                                     application#index {:subdomain=>"dev", :format=>:json}
#                             blog GET      /blog(.:format)                                          greetings#blog {:subdomain=>"dev"}
#                                  GET      /blog/:slug(.:format)                                    greetings#blog {:subdomain=>"dev"}
#                           rating GET      /rating(.:format)                                        greetings#rating {:subdomain=>"dev"}
#                              faq GET      /faq(.:format)                                           greetings#faq {:subdomain=>"dev"}
#             terms_and_conditions GET      /terms-and-conditions(.:format)                          greetings#terms {:subdomain=>"dev"}
#                   privacy_policy GET      /privacy-policy(.:format)                                greetings#policy {:subdomain=>"dev"}
#           campaign_dash_your_day GET      /campaign/dash-your-day(.:format)                        greetings#campaign {:subdomain=>"dev"}
#     campaign_dash_your_day_terms GET      /campaign/dash-your-day/terms(.:format)                  greetings#campaign_terms {:subdomain=>"dev"}
#                  client_category GET      /categories/:category(.:format)                          client/events#index {:subdomain=>"dev"}
#             client_event_express GET      /events/:event_id/express(.:format)                      client/events#express {:subdomain=>"dev"}
#           client_event_selection POST     /events/:event_id/selection(.:format)                    client/events#selection {:subdomain=>"dev"}
#            client_event_checkout POST     /events/:event_id/checkout(.:format)                     client/events#checkout {:subdomain=>"dev"}
#                    client_events GET      /events(.:format)                                        client/events#index {:subdomain=>"dev"}
#                     client_event GET      /events/:id(.:format)                                    client/events#show {:subdomain=>"dev"}
#           client_profile_tickets GET      /profile/:profile_id/tickets(.:format)                   client/profile#tickets {:subdomain=>"dev"}
#            client_profile_orders GET      /profile/:profile_id/orders(.:format)                    client/profile#orders {:subdomain=>"dev"}
#            client_profile_ticket GET      /profile/:profile_id/orders/:ticket_id(.:format)         client/profile#order {:subdomain=>"dev"}
#          client_profile_settings GET      /profile/:profile_id/settings(.:format)                  client/profile#settings {:subdomain=>"dev"}
#                                  PUT      /profile/:profile_id/settings(.:format)                  client/profile#settings_update {:subdomain=>"dev"}
#   client_profile_change_password PUT      /profile/:profile_id/change_password(.:format)           client/profile#change_password {:subdomain=>"dev"}
#             client_profile_index GET      /profile(.:format)                                       client/profile#index {:subdomain=>"dev"}
#                        organizer GET      /organizer(.:format)                                     organizer/dashboard#index {:subdomain=>"dev"}
#           orders_organizer_event GET      /organizer/events/:id/orders(.:format)                   organizer/events#orders {:subdomain=>"dev"}
#          checkin_organizer_event GET      /organizer/events/:id/checkin(.:format)                  organizer/events#checkin {:subdomain=>"dev"}
#        unpublish_organizer_event GET      /organizer/events/:id/unpublish(.:format)                organizer/events#unpublish {:subdomain=>"dev"}
#        published_organizer_event GET      /organizer/events/:id/published(.:format)                organizer/events#published {:subdomain=>"dev"}
#                                  POST     /organizer/events/:event_id/checked/:ticket_id(.:format) organizer/event#ticket_checking {:subdomain=>"dev"}
#                 organizer_events GET      /organizer/events(.:format)                              organizer/events#index {:subdomain=>"dev"}
#                                  POST     /organizer/events(.:format)                              organizer/events#create {:subdomain=>"dev"}
#              new_organizer_event GET      /organizer/events/new(.:format)                          organizer/events#new {:subdomain=>"dev"}
#             edit_organizer_event GET      /organizer/events/:id/edit(.:format)                     organizer/events#edit {:subdomain=>"dev"}
#                  organizer_event GET      /organizer/events/:id(.:format)                          organizer/events#show {:subdomain=>"dev"}
#                                  PATCH    /organizer/events/:id(.:format)                          organizer/events#update {:subdomain=>"dev"}
#                                  PUT      /organizer/events/:id(.:format)                          organizer/events#update {:subdomain=>"dev"}
#                                  DELETE   /organizer/events/:id(.:format)                          organizer/events#destroy {:subdomain=>"dev"}
#                       mobile_api          /                                                        MobileAPI {:subdomain=>"dev-api"}
#              grape_swagger_rails          /documentation                                           GrapeSwaggerRails::Engine {:subdomain=>"dev-api"}
#
# Routes for GrapeSwaggerRails::Engine:
#   root GET  /           grape_swagger_rails/application#index
#

Rails.application.routes.draw do

  get 'hello_world', to: 'hello_world#index'
  get 'errors/not_found'
  get 'errors/internal_server_error'

  match "/404", :to => "errors#not_found", :via => :all
  match "/500", :to => "errors#internal_server_error", :via => :all

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  constraints(subdomain: App.host)  do
    mount Sidekiq::Web => '/workers'
    # mount ActionCable.server => "/cable"

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

    # if App.environment.production?
    #   # root :to => redirect('/campaign/dash-your-day')
    #   root 'greetings#landing'
    # else
    #   root 'client/events#index'
    # end

    root 'client/events#index'
    get '/landing', to: 'greetings#landing'


    get '/react-api' => 'application#index', defaults: { format: :json }

    get '/blog',        to: 'greetings#blog'
    get '/blog/:slug',  to: 'greetings#blog'
    get '/rating',      to: 'greetings#rating'

    get '/about',                 to: 'greetings#about'
    get '/contact',               to: 'greetings#contact'
    get '/faq',                   to: 'greetings#faq'
    get '/terms-and-conditions',  to: 'greetings#terms'
    get '/privacy-policy',        to: 'greetings#policy'

    get '/campaign/dash-your-day',        to: 'greetings#campaign'
    get '/campaign/dash-your-day/terms',  to: 'greetings#campaign_terms'

    namespace :client, path: nil do
      get 'categories/:category', to: 'events#index', as: :category
      resources :events, only: [:index, :show] do
        get '/express', to: 'events#express'
        post '/selection', to: 'events#selection'
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
        member do
          get 'orders', to: 'events#orders'
          get 'checkin', to: 'events#checkin'
          get 'unpublish', to: 'events#unpublish'
          get 'published', to: 'events#published'
          get 'update_time_event', to: 'events#update_time_event'
        end

        post 'checked/:ticket_id', to: 'events#ticket_checking', as: :ticket_checking
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
