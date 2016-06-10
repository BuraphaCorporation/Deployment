Current Directory

```
.
├── api
│   ├── loopback.js
│   ├── package.json
│   └── restify.js
├── daydash.md
├── ios
│   └── client
│       ├── Daydash
│       │   ├── AppDelegate.swift
│       │   ├── Assets.xcassets
│       │   │   └── AppIcon.appiconset
│       │   │       └── Contents.json
│       │   ├── Base.lproj
│       │   │   ├── LaunchScreen.storyboard
│       │   │   └── Main.storyboard
│       │   ├── Daydash.xcdatamodeld
│       │   │   └── Daydash.xcdatamodel
│       │   │       └── contents
│       │   ├── Info.plist
│       │   └── ViewController.swift
│       ├── Daydash.xcodeproj
│       │   ├── project.pbxproj
│       │   ├── project.xcworkspace
│       │   │   ├── contents.xcworkspacedata
│       │   │   └── xcuserdata
│       │   │       └── skilllane.xcuserdatad
│       │   │           └── UserInterfaceState.xcuserstate
│       │   └── xcuserdata
│       │       └── skilllane.xcuserdatad
│       │           └── xcschemes
│       │               ├── Daydash.xcscheme
│       │               └── xcschememanagement.plist
│       ├── DaydashTests
│       │   ├── DaydashTests.swift
│       │   └── Info.plist
│       └── DaydashUITests
│           ├── DaydashUITests.swift
│           └── Info.plist
└── web
    ├── Bowerfile
    ├── Capfile
    ├── Gemfile
    ├── Gemfile.lock
    ├── README.md
    ├── Rakefile
    ├── app
    │   ├── assets
    │   │   ├── images
    │   │   ├── javascripts
    │   │   │   ├── admin
    │   │   │   │   ├── dashboard.coffee
    │   │   │   │   ├── event.coffee
    │   │   │   │   └── portal.coffee
    │   │   │   ├── application.js
    │   │   │   ├── greetings.coffee
    │   │   │   ├── organizer.coffee
    │   │   │   └── users.coffee
    │   │   └── stylesheets
    │   │       ├── admin
    │   │       │   ├── dashboard.sass
    │   │       │   ├── event.sass
    │   │       │   └── portal.sass
    │   │       ├── application.sass
    │   │       ├── font.scss
    │   │       ├── greetings.sass
    │   │       ├── organizer.sass
    │   │       └── users.sass
    │   ├── controllers
    │   │   ├── admin
    │   │   │   ├── dashboard_controller.rb
    │   │   │   ├── events_controller.rb
    │   │   │   ├── portal_controller.rb
    │   │   │   └── users_controller.rb
    │   │   ├── application_controller.rb
    │   │   ├── concerns
    │   │   ├── greetings_controller.rb
    │   │   ├── organizers
    │   │   │   └── portal_controller.rb
    │   │   └── users
    │   │       ├── confirmations_controller.rb
    │   │       ├── omniauth_callbacks_controller.rb
    │   │       ├── passwords_controller.rb
    │   │       ├── registrations_controller.rb
    │   │       ├── sessions_controller.rb
    │   │       └── unlocks_controller.rb
    │   ├── helpers
    │   │   ├── admin
    │   │   │   └── portal_helper.rb
    │   │   ├── application_helper.rb
    │   │   └── greetings_helper.rb
    │   ├── mailers
    │   ├── models
    │   │   ├── app.rb
    │   │   ├── category.rb
    │   │   ├── concerns
    │   │   ├── event.rb
    │   │   ├── event_attachment.rb
    │   │   ├── from_to_date.rb
    │   │   ├── payment.rb
    │   │   ├── role.rb
    │   │   ├── tag.rb
    │   │   ├── tagging.rb
    │   │   ├── ticket.rb
    │   │   ├── user.rb
    │   │   └── wishlist.rb
    │   └── views
    │       ├── admin
    │       │   ├── _aside.html.erb
    │       │   ├── _footer.html.erb
    │       │   ├── _header.html.erb
    │       │   ├── dashboard
    │       │   │   └── index.html.erb
    │       │   ├── events
    │       │   │   ├── edit.html.erb
    │       │   │   ├── index.html.erb
    │       │   │   └── new.html.erb
    │       │   └── users
    │       │       ├── edit.html.erb
    │       │       ├── index.html.erb
    │       │       └── new.html.erb
    │       ├── greetings
    │       │   └── hello.html.erb
    │       ├── layouts
    │       │   ├── admin.html.erb
    │       │   ├── application.html.erb
    │       │   └── auth.html.erb
    │       ├── organizers
    │       │   ├── index.html.erb
    │       │   └── portal
    │       │       └── index.html.erb
    │       └── users
    │           ├── confirmations
    │           │   └── new.html.erb
    │           ├── mailer
    │           │   ├── confirmation_instructions.html.erb
    │           │   ├── password_change.html.erb
    │           │   ├── reset_password_instructions.html.erb
    │           │   └── unlock_instructions.html.erb
    │           ├── passwords
    │           │   ├── edit.html.erb
    │           │   └── new.html.erb
    │           ├── registrations
    │           │   ├── edit.html.erb
    │           │   └── new.html.erb
    │           ├── sessions
    │           │   └── new.html.erb
    │           ├── shared
    │           │   ├── _forgot_password.html.erb
    │           │   ├── _links.html.erb
    │           │   ├── _signin.html.erb
    │           │   ├── _signup.html.erb
    │           │   └── _social.html.erb
    │           └── unlocks
    │               └── new.html.erb
    ├── bin
    │   ├── _guard-core
    │   ├── aws.rb
    │   ├── bundle
    │   ├── byebug
    │   ├── cap
    │   ├── capify
    │   ├── coderay
    │   ├── convert_to_should_syntax
    │   ├── erubis
    │   ├── guard
    │   ├── htmldiff
    │   ├── ldiff
    │   ├── listen
    │   ├── nokogiri
    │   ├── pry
    │   ├── rackup
    │   ├── rails
    │   ├── rake
    │   ├── rdoc
    │   ├── ri
    │   ├── rspec
    │   ├── sass
    │   ├── sass-convert
    │   ├── scss
    │   ├── sdoc
    │   ├── sdoc-merge
    │   ├── setup
    │   ├── spring
    │   ├── sprockets
    │   ├── thor
    │   ├── tilt
    │   ├── unicorn
    │   └── unicorn_rails
    ├── circle.yml
    ├── config
    │   ├── application.rb
    │   ├── boot.rb
    │   ├── database.yml
    │   ├── deploy
    │   │   ├── production.rb
    │   │   └── staging.rb
    │   ├── deploy.rb
    │   ├── environment.rb
    │   ├── environments
    │   │   ├── development.rb
    │   │   ├── production.rb
    │   │   └── test.rb
    │   ├── initializers
    │   │   ├── assets.rb
    │   │   ├── backtrace_silencers.rb
    │   │   ├── bower_rails.rb
    │   │   ├── cookies_serializer.rb
    │   │   ├── devise.rb
    │   │   ├── filter_parameter_logging.rb
    │   │   ├── inflections.rb
    │   │   ├── mime_types.rb
    │   │   ├── session_store.rb
    │   │   └── wrap_parameters.rb
    │   ├── instance.yml
    │   ├── locales
    │   │   ├── devise.en.yml
    │   │   └── en.yml
    │   ├── routes.rb
    │   └── secrets.yml
    ├── config.ru
    ├── db
    │   ├── migrate
    │   │   ├── 20160509143225_devise_create_users.rb
    │   │   ├── 20160509230604_add_omniauth_to_users.rb
    │   │   ├── 20160514043750_create_events.rb
    │   │   ├── 20160514051256_create_from_to_dates.rb
    │   │   ├── 20160514065123_create_tags.rb
    │   │   ├── 20160514065134_create_tickets.rb
    │   │   ├── 20160514065208_create_wishlists.rb
    │   │   ├── 20160514065217_create_payments.rb
    │   │   ├── 20160514224403_create_roles.rb
    │   │   ├── 20160514224404_add_role_id_to_user.rb
    │   │   ├── 20160518014227_create_taggings.rb
    │   │   ├── 20160520154102_add_avatars_to_users.rb
    │   │   ├── 20160521002353_create_event_attachments.rb
    │   │   └── 20160521005504_create_categories.rb
    │   ├── schema.rb
    │   └── seeds.rb
    ├── lib
    │   ├── assets
    │   └── tasks
    ├── log
    ├── public
    │   ├── 404.html
    │   ├── 422.html
    │   ├── 500.html
    │   ├── favicon.ico
    │   ├── fonts
    │   │   ├── FontAwesome.otf
    │   │   ├── fontawesome-webfont.eot
    │   │   ├── fontawesome-webfont.svg
    │   │   ├── fontawesome-webfont.ttf
    │   │   ├── fontawesome-webfont.woff
    │   │   └── fontawesome-webfont.woff2
    │   └── robots.txt
    ├── spec
    │   ├── controllers
    │   │   ├── admin
    │   │   │   ├── dashboard_controller_spec.rb
    │   │   │   ├── event_controller_spec.rb
    │   │   │   └── portal_controller_spec.rb
    │   │   ├── application_controller_spec.rb
    │   │   ├── greetings_controller_spec.rb
    │   │   └── organizers
    │   │       └── portal_controller_spec.rb
    │   ├── factories
    │   │   ├── categories.rb
    │   │   ├── event_attachments.rb
    │   │   ├── events.rb
    │   │   ├── from_to_dates.rb
    │   │   ├── payments.rb
    │   │   ├── roles.rb
    │   │   ├── taggings.rb
    │   │   ├── tags.rb
    │   │   ├── tickets.rb
    │   │   ├── users.rb
    │   │   └── wishlists.rb
    │   ├── models
    │   │   ├── category_spec.rb
    │   │   ├── event_attachment_spec.rb
    │   │   ├── event_spec.rb
    │   │   ├── from_to_date_spec.rb
    │   │   ├── payment_spec.rb
    │   │   ├── role_spec.rb
    │   │   ├── tag_spec.rb
    │   │   ├── tagging_spec.rb
    │   │   ├── ticket_spec.rb
    │   │   ├── user_spec.rb
    │   │   └── wishlist_spec.rb
    │   ├── rails_helper.rb
    │   └── spec_helper.rb
    └── vendor
        └── assets
            ├── admin
            │   ├── css
            │   │   ├── app-blue.css
            │   │   ├── app-custom.css
            │   │   ├── app-green.css
            │   │   ├── app-orange.css
            │   │   ├── app-purple.css
            │   │   ├── app-red.css
            │   │   ├── app-seagreen.css
            │   │   ├── app.css
            │   │   └── vendor.css
            │   ├── fonts
            │   │   ├── FontAwesome.otf
            │   │   ├── fontawesome-webfont.eot
            │   │   ├── fontawesome-webfont.svg
            │   │   ├── fontawesome-webfont.ttf
            │   │   ├── fontawesome-webfont.woff
            │   │   └── fontawesome-webfont.woff2
            │   └── js
            │       ├── app.js
            │       └── vendor.js
            ├── bower.json
            ├── javascripts
            └── stylesheets

81 directories, 236 files
```
