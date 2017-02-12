# == Route Map
#
#                            Prefix Verb     URI Pattern                                               Controller#Action
#                       sidekiq_web          /workers                                                  Sidekiq::Web {:subdomain=>""}
#                  new_user_session GET      /auth/sign_in(.:format)                                   user/sessions#new {:subdomain=>""}
#                      user_session POST     /auth/sign_in(.:format)                                   user/sessions#create {:subdomain=>""}
#              destroy_user_session DELETE   /auth/sign_out(.:format)                                  user/sessions#destroy {:subdomain=>""}
#  user_facebook_omniauth_authorize GET|POST /auth/facebook(.:format)                                  user/omniauth_callbacks#passthru {:subdomain=>""}
#   user_facebook_omniauth_callback GET|POST /auth/facebook/callback(.:format)                         user/omniauth_callbacks#facebook {:subdomain=>""}
#                 new_user_password GET      /auth/password/new(.:format)                              user/passwords#new {:subdomain=>""}
#                edit_user_password GET      /auth/password/edit(.:format)                             user/passwords#edit {:subdomain=>""}
#                     user_password PATCH    /auth/password(.:format)                                  user/passwords#update {:subdomain=>""}
#                                   PUT      /auth/password(.:format)                                  user/passwords#update {:subdomain=>""}
#                                   POST     /auth/password(.:format)                                  user/passwords#create {:subdomain=>""}
#          cancel_user_registration GET      /auth/cancel(.:format)                                    user/registrations#cancel {:subdomain=>""}
#             new_user_registration GET      /auth/sign_up(.:format)                                   user/registrations#new {:subdomain=>""}
#            edit_user_registration GET      /auth/edit(.:format)                                      user/registrations#edit {:subdomain=>""}
#                 user_registration PATCH    /auth(.:format)                                           user/registrations#update {:subdomain=>""}
#                                   PUT      /auth(.:format)                                           user/registrations#update {:subdomain=>""}
#                                   DELETE   /auth(.:format)                                           user/registrations#destroy {:subdomain=>""}
#                                   POST     /auth(.:format)                                           user/registrations#create {:subdomain=>""}
#                              root GET      /                                                         client/events#index {:subdomain=>""}
#                              beta GET      /beta(.:format)                                           client/react#index {:subdomain=>""}
#                           landing GET      /landing(.:format)                                        greetings#landing {:subdomain=>""}
#                            rating GET      /rating(.:format)                                         greetings#rating {:subdomain=>""}
#                             about GET      /about(.:format)                                          greetings#about {:subdomain=>""}
#                           contact GET      /contact(.:format)                                        greetings#contact {:subdomain=>""}
#                               faq GET      /faq(.:format)                                            greetings#faq {:subdomain=>""}
#              terms_and_conditions GET      /terms-and-conditions(.:format)                           greetings#terms {:subdomain=>""}
#                    privacy_policy GET      /privacy-policy(.:format)                                 greetings#policy {:subdomain=>""}
#            campaign_dash_your_day GET      /campaign/dash-your-day(.:format)                         greetings#campaign {:subdomain=>""}
#      campaign_dash_your_day_terms GET      /campaign/dash-your-day/terms(.:format)                   greetings#campaign_terms {:subdomain=>""}
#                   client_category GET      /categories/:category(.:format)                           client/events#index {:subdomain=>""}
#                     client_events GET      /events(.:format)                                         client/events#index {:subdomain=>""}
#                      client_event GET      /events/:id(.:format)                                     client/events#show {:subdomain=>""}
#            client_payment_express GET      /events/:payment_id/express(.:format)                     client/payments#express {:subdomain=>""}
#          client_payment_selection POST     /events/:payment_id/selection(.:format)                   client/payments#selection {:subdomain=>""}
#           client_payment_checkout POST     /events/:payment_id/checkout(.:format)                    client/payments#checkout {:subdomain=>""}
#                   client_payments GET      /events(.:format)                                         client/payments#index {:subdomain=>""}
#                                   POST     /events(.:format)                                         client/payments#create {:subdomain=>""}
#                new_client_payment GET      /events/new(.:format)                                     client/payments#new {:subdomain=>""}
#               edit_client_payment GET      /events/:id/edit(.:format)                                client/payments#edit {:subdomain=>""}
#                    client_payment GET      /events/:id(.:format)                                     client/payments#show {:subdomain=>""}
#                                   PATCH    /events/:id(.:format)                                     client/payments#update {:subdomain=>""}
#                                   PUT      /events/:id(.:format)                                     client/payments#update {:subdomain=>""}
#                                   DELETE   /events/:id(.:format)                                     client/payments#destroy {:subdomain=>""}
#            client_profile_tickets GET      /profiles/:profile_id/tickets(.:format)                   client/profiles#tickets {:subdomain=>""}
#             client_profile_orders GET      /profiles/:profile_id/orders(.:format)                    client/profiles#orders {:subdomain=>""}
#             client_profile_ticket GET      /profiles/:profile_id/orders/:ticket_id(.:format)         client/profiles#order {:subdomain=>""}
#           client_profile_settings GET      /profiles/:profile_id/settings(.:format)                  client/profiles#settings {:subdomain=>""}
#                                   PUT      /profiles/:profile_id/settings(.:format)                  client/profiles#settings_update {:subdomain=>""}
#    client_profile_change_password PUT      /profiles/:profile_id/change_password(.:format)           client/profiles#change_password {:subdomain=>""}
#                   client_profiles GET      /profiles(.:format)                                       client/profiles#index {:subdomain=>""}
#         dashboard_organizer_event GET      /organizers/events/:id/dashboard(.:format)                organizer/events#dashboard {:subdomain=>""}
#            orders_organizer_event GET      /organizers/events/:id/orders(.:format)                   organizer/events#orders {:subdomain=>""}
#     orders_detail_organizer_event GET      /organizers/events/:id/orders/:code/detail(.:format)      organizer/events#orders_detail {:subdomain=>""}
#         attendees_organizer_event GET      /organizers/events/:id/attendees(.:format)                organizer/events#attendees {:subdomain=>""}
#           checkin_organizer_event GET      /organizers/events/:id/checkin(.:format)                  organizer/events#checkin {:subdomain=>""}
#         unpublish_organizer_event GET      /organizers/events/:id/unpublish(.:format)                organizer/events#unpublish {:subdomain=>""}
#         published_organizer_event GET      /organizers/events/:id/published(.:format)                organizer/events#published {:subdomain=>""}
# update_time_event_organizer_event GET      /organizers/events/:id/update_time_event(.:format)        organizer/events#update_time_event {:subdomain=>""}
#  order_attachment_organizer_event GET      /organizers/events/:id/order_attachment(.:format)         organizer/events#order_attachment {:subdomain=>""}
# update_attachment_organizer_event PUT      /organizers/events/:id/update_attachment(.:format)        organizer/events#update_attachment {:subdomain=>""}
# delete_attachment_organizer_event DELETE   /organizers/events/:id/delete_attachment(.:format)        organizer/events#delete_attachment {:subdomain=>""}
#    delete_section_organizer_event DELETE   /organizers/events/:id/delete_section(.:format)           organizer/events#delete_section {:subdomain=>""}
#   organizer_event_ticket_checking POST     /organizers/events/:event_id/checked/:ticket_id(.:format) organizer/events#ticket_checking {:subdomain=>""}
#                  organizer_events GET      /organizers/events(.:format)                              organizer/events#index {:subdomain=>""}
#                                   POST     /organizers/events(.:format)                              organizer/events#create {:subdomain=>""}
#               new_organizer_event GET      /organizers/events/new(.:format)                          organizer/events#new {:subdomain=>""}
#              edit_organizer_event GET      /organizers/events/:id/edit(.:format)                     organizer/events#edit {:subdomain=>""}
#                   organizer_event GET      /organizers/events/:id(.:format)                          organizer/events#show {:subdomain=>""}
#                                   PATCH    /organizers/events/:id(.:format)                          organizer/events#update {:subdomain=>""}
#                                   PUT      /organizers/events/:id(.:format)                          organizer/events#update {:subdomain=>""}
#                                   DELETE   /organizers/events/:id(.:format)                          organizer/events#destroy {:subdomain=>""}
#                         organizer GET      /organizers/:organizer(.:format)                          organizer/profiles#show {:subdomain=>""}
#                    organizer_root GET      /organizers(.:format)                                     organizer/profiles#index {:subdomain=>""}
#                             admin GET      /admin(.:format)                                          admin/events#index {:subdomain=>""}
#                       admin_users GET      /admin/users(.:format)                                    admin/users#index {:subdomain=>""}
#                admin_transactions GET      /admin/transactions(.:format)                             admin/users#transactions {:subdomain=>""}
#                                   PUT      /admin/approve/:order_id(.:format)                        admin/temporary#approving {:subdomain=>""}
#                                   PUT      /admin/cancel/:order_id(.:format)                         admin/temporary#approving {:subdomain=>""}
#                                   POST     /admin/send_email/:order_id(.:format)                     admin/temporary#send_email {:subdomain=>""}
#                admin_manage_users GET      /admin/manage/users(.:format)                             admin/temporary#index {:subdomain=>""}
#         admin_manage_transactions GET      /admin/manage/transactions(.:format)                      admin/temporary#transactions {:subdomain=>""}
#              admin_manage_approve PUT      /admin/manage/approve/:order_id(.:format)                 admin/temporary#approving {:subdomain=>""}
#               admin_manage_cancel PUT      /admin/manage/cancel/:order_id(.:format)                  admin/temporary#approving {:subdomain=>""}
#           admin_manage_send_email POST     /admin/manage/send_email/:order_id(.:format)              admin/temporary#send_email {:subdomain=>""}
#                   application_api          /                                                         ApplicationAPI {:subdomain=>"api"}
#               grape_swagger_rails          /explorer                                                 GrapeSwaggerRails::Engine {:subdomain=>"api"}
#                        refile_app          /attachments                                              #<Refile::App app_file="/Users/arnonhongklay/.rbenv/versions/2.3.3/lib/ruby/gems/2.3.0/bundler/gems/refile-d7a42dcd7cf6/lib/refile/app.rb">
#
# Routes for GrapeSwaggerRails::Engine:
#   root GET  /           grape_swagger_rails/application#index
#

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

    root 'client/react#index'
    # root 'organizer/events#index'

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

    # namespace :client, path: nil do
    #   get 'categories/:category', to: 'events#index', as: :category
    #
    #   resources :events, only: [:index, :show]
    #
    #   resources :payments, path: 'events' do
    #     get '/express',             to: 'payments#express'
    #     post '/selection',          to: 'payments#selection'
    #     post '/checkout',           to: 'payments#checkout'
    #   end
    #
    #   resources :profiles, only: :index do
    #     get '/tickets',             to: 'profiles#tickets'
    #     get '/orders',              to: 'profiles#orders'
    #     get '/orders/:ticket_id/',  to: 'profiles#order', as: :ticket
    #     get '/settings',            to: 'profiles#settings'
    #     put '/settings',            to: 'profiles#settings_update'
    #     put '/change_password',     to: 'profiles#change_password'
    #   end
    # end

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

    namespace :admin, path: 'admin' do
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
end
