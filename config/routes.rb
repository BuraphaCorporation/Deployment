# == Route Map
#
#                            Prefix Verb     URI Pattern                                              Controller#Action
#                  errors_not_found GET      /errors/not_found(.:format)                              errors#not_found
#      errors_internal_server_error GET      /errors/internal_server_error(.:format)                  errors#internal_server_error
#                                            /404(.:format)                                           errors#not_found
#                                            /500(.:format)                                           errors#internal_server_error
#                       sidekiq_web          /workers                                                 Sidekiq::Web {:subdomain=>"dev"}
#                  new_user_session GET      /auth/sign_in(.:format)                                  users/sessions#new {:subdomain=>"dev"}
#                      user_session POST     /auth/sign_in(.:format)                                  users/sessions#create {:subdomain=>"dev"}
#              destroy_user_session DELETE   /auth/sign_out(.:format)                                 users/sessions#destroy {:subdomain=>"dev"}
#  user_facebook_omniauth_authorize GET|POST /auth/facebook(.:format)                                 users/omniauth_callbacks#passthru {:subdomain=>"dev"}
#   user_facebook_omniauth_callback GET|POST /auth/facebook/callback(.:format)                        users/omniauth_callbacks#facebook {:subdomain=>"dev"}
#                     user_password POST     /auth/password(.:format)                                 users/passwords#create {:subdomain=>"dev"}
#                 new_user_password GET      /auth/password/new(.:format)                             users/passwords#new {:subdomain=>"dev"}
#                edit_user_password GET      /auth/password/edit(.:format)                            users/passwords#edit {:subdomain=>"dev"}
#                                   PATCH    /auth/password(.:format)                                 users/passwords#update {:subdomain=>"dev"}
#                                   PUT      /auth/password(.:format)                                 users/passwords#update {:subdomain=>"dev"}
#          cancel_user_registration GET      /auth/cancel(.:format)                                   users/registrations#cancel {:subdomain=>"dev"}
#                 user_registration POST     /auth(.:format)                                          users/registrations#create {:subdomain=>"dev"}
#             new_user_registration GET      /auth/sign_up(.:format)                                  users/registrations#new {:subdomain=>"dev"}
#            edit_user_registration GET      /auth/edit(.:format)                                     users/registrations#edit {:subdomain=>"dev"}
#                                   PATCH    /auth(.:format)                                          users/registrations#update {:subdomain=>"dev"}
#                                   PUT      /auth(.:format)                                          users/registrations#update {:subdomain=>"dev"}
#                                   DELETE   /auth(.:format)                                          users/registrations#destroy {:subdomain=>"dev"}
#                              root GET      /                                                        client/events#index {:subdomain=>"dev"}
#                           landing GET      /landing(.:format)                                       greetings#landing {:subdomain=>"dev"}
#                         react_api GET      /react-api(.:format)                                     application#index {:subdomain=>"dev", :format=>:json}
#                              blog GET      /blog(.:format)                                          greetings#blog {:subdomain=>"dev"}
#                                   GET      /blog/:slug(.:format)                                    greetings#blog {:subdomain=>"dev"}
#                            rating GET      /rating(.:format)                                        greetings#rating {:subdomain=>"dev"}
#                             about GET      /about(.:format)                                         greetings#about {:subdomain=>"dev"}
#                           contact GET      /contact(.:format)                                       greetings#contact {:subdomain=>"dev"}
#                               faq GET      /faq(.:format)                                           greetings#faq {:subdomain=>"dev"}
#              terms_and_conditions GET      /terms-and-conditions(.:format)                          greetings#terms {:subdomain=>"dev"}
#                    privacy_policy GET      /privacy-policy(.:format)                                greetings#policy {:subdomain=>"dev"}
#            campaign_dash_your_day GET      /campaign/dash-your-day(.:format)                        greetings#campaign {:subdomain=>"dev"}
#      campaign_dash_your_day_terms GET      /campaign/dash-your-day/terms(.:format)                  greetings#campaign_terms {:subdomain=>"dev"}
#                   client_category GET      /categories/:category(.:format)                          client/events#index {:subdomain=>"dev"}
#              client_event_express GET      /events/:event_id/express(.:format)                      client/events#express {:subdomain=>"dev"}
#            client_event_selection POST     /events/:event_id/selection(.:format)                    client/events#selection {:subdomain=>"dev"}
#             client_event_checkout POST     /events/:event_id/checkout(.:format)                     client/events#checkout {:subdomain=>"dev"}
#                     client_events GET      /events(.:format)                                        client/events#index {:subdomain=>"dev"}
#                      client_event GET      /events/:id(.:format)                                    client/events#show {:subdomain=>"dev"}
#            client_profile_tickets GET      /profile/:profile_id/tickets(.:format)                   client/profile#tickets {:subdomain=>"dev"}
#             client_profile_orders GET      /profile/:profile_id/orders(.:format)                    client/profile#orders {:subdomain=>"dev"}
#             client_profile_ticket GET      /profile/:profile_id/orders/:ticket_id(.:format)         client/profile#order {:subdomain=>"dev"}
#           client_profile_settings GET      /profile/:profile_id/settings(.:format)                  client/profile#settings {:subdomain=>"dev"}
#                                   PUT      /profile/:profile_id/settings(.:format)                  client/profile#settings_update {:subdomain=>"dev"}
#    client_profile_change_password PUT      /profile/:profile_id/change_password(.:format)           client/profile#change_password {:subdomain=>"dev"}
#              client_profile_index GET      /profile(.:format)                                       client/profile#index {:subdomain=>"dev"}
#            orders_organizer_event GET      /organizer/events/:id/orders(.:format)                   organizer/events#orders {:subdomain=>"dev"}
#           checkin_organizer_event GET      /organizer/events/:id/checkin(.:format)                  organizer/events#checkin {:subdomain=>"dev"}
#         unpublish_organizer_event GET      /organizer/events/:id/unpublish(.:format)                organizer/events#unpublish {:subdomain=>"dev"}
#         published_organizer_event GET      /organizer/events/:id/published(.:format)                organizer/events#published {:subdomain=>"dev"}
# update_time_event_organizer_event GET      /organizer/events/:id/update_time_event(.:format)        organizer/events#update_time_event {:subdomain=>"dev"}
#   organizer_event_ticket_checking POST     /organizer/events/:event_id/checked/:ticket_id(.:format) organizer/events#ticket_checking {:subdomain=>"dev"}
#                  organizer_events GET      /organizer/events(.:format)                              organizer/events#index {:subdomain=>"dev"}
#                                   POST     /organizer/events(.:format)                              organizer/events#create {:subdomain=>"dev"}
#               new_organizer_event GET      /organizer/events/new(.:format)                          organizer/events#new {:subdomain=>"dev"}
#              edit_organizer_event GET      /organizer/events/:id/edit(.:format)                     organizer/events#edit {:subdomain=>"dev"}
#                   organizer_event GET      /organizer/events/:id(.:format)                          organizer/events#show {:subdomain=>"dev"}
#                                   PATCH    /organizer/events/:id(.:format)                          organizer/events#update {:subdomain=>"dev"}
#                                   PUT      /organizer/events/:id(.:format)                          organizer/events#update {:subdomain=>"dev"}
#                                   DELETE   /organizer/events/:id(.:format)                          organizer/events#destroy {:subdomain=>"dev"}
#                                   GET      /organizer(.:format)                                     organizer/profile#index {:subdomain=>"dev"}
#                         organizer GET      /organizer/:organizer(.:format)                          organizer/profile#show {:subdomain=>"dev"}
#                       admin_users GET      /admin/users(.:format)                                   admin/users#index {:subdomain=>"dev"}
#                                   POST     /admin/users(.:format)                                   admin/users#create {:subdomain=>"dev"}
#                    new_admin_user GET      /admin/users/new(.:format)                               admin/users#new {:subdomain=>"dev"}
#                   edit_admin_user GET      /admin/users/:id/edit(.:format)                          admin/users#edit {:subdomain=>"dev"}
#                        admin_user GET      /admin/users/:id(.:format)                               admin/users#show {:subdomain=>"dev"}
#                                   PATCH    /admin/users/:id(.:format)                               admin/users#update {:subdomain=>"dev"}
#                                   PUT      /admin/users/:id(.:format)                               admin/users#update {:subdomain=>"dev"}
#                                   DELETE   /admin/users/:id(.:format)                               admin/users#destroy {:subdomain=>"dev"}
#                      admin_events GET      /admin/events(.:format)                                  admin/events#index {:subdomain=>"dev"}
#                                   POST     /admin/events(.:format)                                  admin/events#create {:subdomain=>"dev"}
#                   new_admin_event GET      /admin/events/new(.:format)                              admin/events#new {:subdomain=>"dev"}
#                  edit_admin_event GET      /admin/events/:id/edit(.:format)                         admin/events#edit {:subdomain=>"dev"}
#                       admin_event GET      /admin/events/:id(.:format)                              admin/events#show {:subdomain=>"dev"}
#                                   PATCH    /admin/events/:id(.:format)                              admin/events#update {:subdomain=>"dev"}
#                                   PUT      /admin/events/:id(.:format)                              admin/events#update {:subdomain=>"dev"}
#                                   DELETE   /admin/events/:id(.:format)                              admin/events#destroy {:subdomain=>"dev"}
#                    admin_sections GET      /admin/sections(.:format)                                admin/sections#index {:subdomain=>"dev"}
#                                   POST     /admin/sections(.:format)                                admin/sections#create {:subdomain=>"dev"}
#                 new_admin_section GET      /admin/sections/new(.:format)                            admin/sections#new {:subdomain=>"dev"}
#                edit_admin_section GET      /admin/sections/:id/edit(.:format)                       admin/sections#edit {:subdomain=>"dev"}
#                     admin_section GET      /admin/sections/:id(.:format)                            admin/sections#show {:subdomain=>"dev"}
#                                   PATCH    /admin/sections/:id(.:format)                            admin/sections#update {:subdomain=>"dev"}
#                                   PUT      /admin/sections/:id(.:format)                            admin/sections#update {:subdomain=>"dev"}
#                                   DELETE   /admin/sections/:id(.:format)                            admin/sections#destroy {:subdomain=>"dev"}
#                  admin_categories GET      /admin/categories(.:format)                              admin/categories#index {:subdomain=>"dev"}
#                                   POST     /admin/categories(.:format)                              admin/categories#create {:subdomain=>"dev"}
#                new_admin_category GET      /admin/categories/new(.:format)                          admin/categories#new {:subdomain=>"dev"}
#               edit_admin_category GET      /admin/categories/:id/edit(.:format)                     admin/categories#edit {:subdomain=>"dev"}
#                    admin_category GET      /admin/categories/:id(.:format)                          admin/categories#show {:subdomain=>"dev"}
#                                   PATCH    /admin/categories/:id(.:format)                          admin/categories#update {:subdomain=>"dev"}
#                                   PUT      /admin/categories/:id(.:format)                          admin/categories#update {:subdomain=>"dev"}
#                                   DELETE   /admin/categories/:id(.:format)                          admin/categories#destroy {:subdomain=>"dev"}
#                      admin_orders GET      /admin/orders(.:format)                                  admin/orders#index {:subdomain=>"dev"}
#                                   POST     /admin/orders(.:format)                                  admin/orders#create {:subdomain=>"dev"}
#                   new_admin_order GET      /admin/orders/new(.:format)                              admin/orders#new {:subdomain=>"dev"}
#                  edit_admin_order GET      /admin/orders/:id/edit(.:format)                         admin/orders#edit {:subdomain=>"dev"}
#                       admin_order GET      /admin/orders/:id(.:format)                              admin/orders#show {:subdomain=>"dev"}
#                                   PATCH    /admin/orders/:id(.:format)                              admin/orders#update {:subdomain=>"dev"}
#                                   PUT      /admin/orders/:id(.:format)                              admin/orders#update {:subdomain=>"dev"}
#                                   DELETE   /admin/orders/:id(.:format)                              admin/orders#destroy {:subdomain=>"dev"}
#                    admin_payments GET      /admin/payments(.:format)                                admin/payments#index {:subdomain=>"dev"}
#                                   POST     /admin/payments(.:format)                                admin/payments#create {:subdomain=>"dev"}
#                 new_admin_payment GET      /admin/payments/new(.:format)                            admin/payments#new {:subdomain=>"dev"}
#                edit_admin_payment GET      /admin/payments/:id/edit(.:format)                       admin/payments#edit {:subdomain=>"dev"}
#                     admin_payment GET      /admin/payments/:id(.:format)                            admin/payments#show {:subdomain=>"dev"}
#                                   PATCH    /admin/payments/:id(.:format)                            admin/payments#update {:subdomain=>"dev"}
#                                   PUT      /admin/payments/:id(.:format)                            admin/payments#update {:subdomain=>"dev"}
#                                   DELETE   /admin/payments/:id(.:format)                            admin/payments#destroy {:subdomain=>"dev"}
#                     admin_tickets GET      /admin/tickets(.:format)                                 admin/tickets#index {:subdomain=>"dev"}
#                                   POST     /admin/tickets(.:format)                                 admin/tickets#create {:subdomain=>"dev"}
#                  new_admin_ticket GET      /admin/tickets/new(.:format)                             admin/tickets#new {:subdomain=>"dev"}
#                 edit_admin_ticket GET      /admin/tickets/:id/edit(.:format)                        admin/tickets#edit {:subdomain=>"dev"}
#                      admin_ticket GET      /admin/tickets/:id(.:format)                             admin/tickets#show {:subdomain=>"dev"}
#                                   PATCH    /admin/tickets/:id(.:format)                             admin/tickets#update {:subdomain=>"dev"}
#                                   PUT      /admin/tickets/:id(.:format)                             admin/tickets#update {:subdomain=>"dev"}
#                                   DELETE   /admin/tickets/:id(.:format)                             admin/tickets#destroy {:subdomain=>"dev"}
#                                   GET      /admin(.:format)                                         admin/users#index {:subdomain=>"dev"}
#                        mobile_api          /                                                        MobileAPI {:subdomain=>"dev-api"}
#               grape_swagger_rails          /documentation                                           GrapeSwaggerRails::Engine {:subdomain=>"dev-api"}
#                          v1_users GET      /v1/users(.:format)                                      api/v1/users#index {:subdomain=>"dev-api"}
#                                   POST     /v1/users(.:format)                                      api/v1/users#create {:subdomain=>"dev-api"}
#                       new_v1_user GET      /v1/users/new(.:format)                                  api/v1/users#new {:subdomain=>"dev-api"}
#                      edit_v1_user GET      /v1/users/:id/edit(.:format)                             api/v1/users#edit {:subdomain=>"dev-api"}
#                           v1_user GET      /v1/users/:id(.:format)                                  api/v1/users#show {:subdomain=>"dev-api"}
#                                   PATCH    /v1/users/:id(.:format)                                  api/v1/users#update {:subdomain=>"dev-api"}
#                                   PUT      /v1/users/:id(.:format)                                  api/v1/users#update {:subdomain=>"dev-api"}
#                                   DELETE   /v1/users/:id(.:format)                                  api/v1/users#destroy {:subdomain=>"dev-api"}
#                         v1_events GET      /v1/events(.:format)                                     api/v1/events#index {:subdomain=>"dev-api"}
#                                   POST     /v1/events(.:format)                                     api/v1/events#create {:subdomain=>"dev-api"}
#                      new_v1_event GET      /v1/events/new(.:format)                                 api/v1/events#new {:subdomain=>"dev-api"}
#                     edit_v1_event GET      /v1/events/:id/edit(.:format)                            api/v1/events#edit {:subdomain=>"dev-api"}
#                          v1_event GET      /v1/events/:id(.:format)                                 api/v1/events#show {:subdomain=>"dev-api"}
#                                   PATCH    /v1/events/:id(.:format)                                 api/v1/events#update {:subdomain=>"dev-api"}
#                                   PUT      /v1/events/:id(.:format)                                 api/v1/events#update {:subdomain=>"dev-api"}
#                                   DELETE   /v1/events/:id(.:format)                                 api/v1/events#destroy {:subdomain=>"dev-api"}
#                        refile_app          /attachments                                             #<Refile::App app_file="/Users/arnonhongklay/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/bundler/gems/refile-d7a42dcd7cf6/lib/refile/app.rb">
#
# Routes for GrapeSwaggerRails::Engine:
#   root GET  /           grape_swagger_rails/application#index
#

Rails.application.routes.draw do
  get 'errors/not_found'
  get 'errors/internal_server_error'

  match '/404', :to => 'errors#not_found', :via => :all
  match '/500', :to => 'errors#internal_server_error', :via => :all

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  constraints(subdomain: App.host)  do
    mount Sidekiq::Web => '/workers'
    # mount ActionCable.server => "/cable"

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

    # if App.environment.production?
    #   # root :to => redirect('/campaign/dash-your-day')
    #   root 'greetings#landing'
    # else
    #   root 'client/events#index'
    # end

    root 'client/events#index'
    get 'beta', to: 'client/react#index'

    get '/landing',               to: 'greetings#landing'
    get '/rating',                to: 'greetings#rating'

    get '/about',                 to: 'greetings#about'
    get '/contact',               to: 'greetings#contact'
    get '/faq',                   to: 'greetings#faq'
    get '/terms-and-conditions',  to: 'greetings#terms'
    get '/privacy-policy',        to: 'greetings#policy'

    get '/campaign/dash-your-day',        to: 'greetings#campaign'
    get '/campaign/dash-your-day/terms',  to: 'greetings#campaign_terms'

    namespace :client, path: nil do
      get 'categories/:category', to: 'events#index', as: :category

      resources :events, only: [:index, :show]

      resources :payments, path: 'events' do
        get '/express',             to: 'payments#express'
        post '/selection',          to: 'payments#selection'
        post '/checkout',           to: 'payments#checkout'
      end

      resources :profiles, only: :index do
        get '/tickets',             to: 'profiles#tickets'
        get '/orders',              to: 'profiles#orders'
        get '/orders/:ticket_id/',  to: 'profiles#order', as: :ticket
        get '/settings',            to: 'profiles#settings'
        put '/settings',            to: 'profiles#settings_update'
        put '/change_password',     to: 'profiles#change_password'
      end
    end

    namespace :organizer, path: 'organizers' do
      resources :events do
        member do
          get 'dashboard',            to: 'events#dashboard'
          get 'orders',               to: 'events#orders', format: [:html, :xlsx]
          get 'orders/:code/detail',  to: 'events#orders_detail', as: :orders_detail
          get 'attendees',            to: 'events#attendees', format: [:html, :xlsx]
          get 'checkin',              to: 'events#checkin'

          get 'unpublish',            to: 'events#unpublish'
          get 'published',            to: 'events#published'
          get 'update_time_event',    to: 'events#update_time_event'

          get 'order_attachment',     to: 'events#order_attachment', format: :json
          put 'update_attachment',    to: 'events#update_attachment', format: :json
          delete 'delete_attachment', to: 'events#delete_attachment', format: :json

          delete 'delete_section',    to: 'events#delete_section'
        end

        post 'checked/:ticket_id',    to: 'events#ticket_checking', as: :ticket_checking
        # collection do
          # delete ':id/attachment/:media_id', to: 'events#delete_attachment', as: :delete_attachment
        # end
      end
      # resources :users, except: :show

      get '/:organizer', to: 'profiles#show'
      root to: "profiles#index"
    end

    namespace :admin do
      # root to: 'events#index'
      get '/',                      to: 'events#index'
      get '/users',                 to: 'users#index'
      get '/transactions',          to: 'users#transactions'
      put '/approve/:order_id',     to: 'temporary#approving'
      put '/cancel/:order_id',      to: 'temporary#approving'
      post '/send_email/:order_id', to: 'temporary#send_email'
      # resources :events do
      #   collection do
      #     delete ':id/attachment/:media_id', to: 'events#delete_attachment', as: :delete_attachment
      #   end
      # end
      # resources :users, except: :show

      get 'manage/users',                 to: 'temporary#index',        as: :manage_users
      get 'manage/transactions',          to: 'temporary#transactions', as: :manage_transactions
      put 'manage/approve/:order_id',     to: 'temporary#approving',    as: :manage_approve
      put 'manage/cancel/:order_id',      to: 'temporary#approving',    as: :manage_cancel
      post 'manage/send_email/:order_id', to: 'temporary#send_email',   as: :manage_send_email

      # resources :users
      # resources :events
      # resources :sections
      # resources :categories
      # resources :categories_events
      # resources :event_pictures
      # resources :orders
      # resources :payments
      # resources :tickets
      # resources :tags
      # resources :taggings
      # resources :wishlists
      # root to: "users#index"
    end
  end

  constraints(subdomain: App.api_host) do
    mount MobileAPI, at: "/"
    mount GrapeSwaggerRails::Engine, at: "/documentation"

    scope module: 'api' do
      namespace :v1 do
        resources :users
        resources :events
      end
    end
  end
end
