source 'https://rubygems.org'
ruby '2.3.1'

gem 'rails', '5.0.0.1'
# gem 'sinatra', github: 'sinatra/sinatra'
# gem 'rack', github: 'rack/rack'

gem 'refile',             git: 'git@github.com:arnonhongklay/refile.git', require: 'refile/rails'
gem 'refile-mini_magick', git: 'git@github.com:arnonhongklay/refile-mini_magick.git'
gem 'sinatra',            git: 'git@github.com:arnonhongklay/sinatra.git', branch: 'master'

# helper views
gem 'turbolinks', '~> 5'
gem 'sass-rails', '~> 5.0'
# gem 'bootstrap', '~> 4.0.0.alpha3.1'
gem 'bootstrap-sass'
gem 'font-awesome-sass', '~> 4.6.2'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'sprockets'
gem 'sprockets-es6'
gem 'jquery-rails'
gem 'jquery-turbolinks'
gem 'jquery-ui-rails'
gem 'jquery-validation-rails'
gem 'parsley-rails'
gem 'react-rails'
gem "react_on_rails", "~> 6"
gem 'react-rails-hot-loader'
gem 'slick_rails'
gem 'momentjs-rails'
gem 'bootstrap3-datetimepicker-rails', '~> 4.17.42'
gem 'simple_form'
gem 'show_for'
gem 'cocoon'
gem 'rails_autolink'
# gem 'sweet-alert'
# gem 'sweet-alert-confirm'

# helper model
gem 'figaro'
gem 'annotate'
gem 'bcrypt', '~> 3.1.7'
gem 'paranoia', git: 'https://github.com/rubysherpas/paranoia', branch: 'rails5'
gem 'active_model_serializers'
gem 'activemodel-serializers-xml'
gem 'rails-controller-testing'
gem 'rack-cors'
gem 'rack-attack'
gem 'open_uri_redirections'
gem 'paperclip'
gem 'paperclip-ffmpeg'
gem 'rqrcode_png'
gem 'dragonfly', '~> 1.0.12'
gem 'friendly_id', '~> 5.1.0'
gem 'has_scope'
gem 'enumerize'
gem 'meta-tags'

# make api
gem 'jbuilder', '~> 2.5'
gem 'grape'
gem 'grape-entity'
gem 'grape-swagger'
gem 'grape-swagger-rails'
gem 'grape-active_model_serializers'

# nosql
gem 'redis', '~>3.2'
gem 'redis-namespace'
gem 'dalli', '~> 2.7.4'
gem 'firebase'
gem 'parse-ruby-client', git: 'https://github.com/adelevie/parse-ruby-client'

# API
gem 'devise'
gem 'omniauth-facebook'
gem 'koala'
gem 'omise'
gem 'aws-sdk', '>= 2.0.34'
gem 'gcloud'
gem 'intercom-rails'
gem 'one_signal'
gem 'mailgun'
gem 'slack-notifier'

# worker
gem 'sidekiq'
gem 'sidekiq-cron'
# gem 'sidekiq-scheduler', '~> 2.0'
gem 'devise-async'

# error handler
gem 'rollbar'

# marketing
gem 'google-api-client'
gem 'mixpanel-ruby'
gem 'vanity'
gem 'split'

gem 'administrate', git: 'git@github.com:arnonhongklay/administrate.git', branch: 'rails-5'
gem 'ransack', github: 'activerecord-hackery/ransack'
gem 'bourbon'
gem 'neat'
gem 'kaminari' #, git: "https://github.com/amatsuda/kaminari.git", branch: 'master'

group :development, :test do
  gem 'pry'
  gem 'rspec-rails', '~> 3.0'
  gem 'factory_girl_rails'
  gem 'ffaker'
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'shoulda'
  gem 'guard'
  gem 'guard-rspec'
  gem 'database_cleaner'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  gem 'capistrano', '~> 3.1'
  gem 'capistrano-rails', '~> 1.1'
  gem 'capistrano-bundler', '~> 1.1.2'
  gem 'capistrano-rbenv', git: 'https://github.com/capistrano/rbenv'

  gem 'airbrussh', require: false
  gem 'slackistrano', '3.1.0.beta'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

platform :ruby do
  gem 'pg'
  gem 'puma'
  gem 'unicorn'
  gem 'mini_racer'
end

group :production do
  gem 'rails_12factor'
end
