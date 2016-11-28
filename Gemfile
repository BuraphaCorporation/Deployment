source 'https://rubygems.org'
ruby '2.3.1'

gem 'rails', '~> 5.0.0', '>= 5.0.0.1'

gem 'refile',             git: 'git@github.com:arnonhongklay/refile', require: 'refile/rails'
gem 'refile-mini_magick', git: 'git@github.com:arnonhongklay/refile-mini_magick'
gem 'sinatra',            git: 'git@github.com:arnonhongklay/sinatra', branch: 'master'

# core lib for views
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'sprockets', '~> 3.0'
gem 'sprockets-es6'
gem 'turbolinks', '~> 5'
gem 'sass-rails', '~> 5.0'

# helper views
gem 'bootstrap-sass'
gem 'font-awesome-sass', '~> 4.6.2'
gem 'bootstrap3-datetimepicker-rails', '~> 4.17.42'

# gem "react_on_rails", "~> 6"
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'jquery-turbolinks'
gem 'jquery-slick-rails'
gem 'jquery-validation-rails'
gem 'parsley-rails'
gem 'momentjs-rails'

gem 'simple_form'
gem 'show_for'
gem 'cocoon'
gem 'rails_autolink'
gem 'rails-controller-testing'
gem 'kaminari' #, git: "https://github.com/amatsuda/kaminari.git", branch: 'master'

# ActiveRecord Helper
gem 'figaro'
gem 'annotate'
gem 'has_scope'
gem 'enumerize'
gem 'friendly_id', '~> 5.1.0'
gem 'paranoia', git: 'https://github.com/rubysherpas/paranoia', branch: 'rails5'
gem 'activemodel-serializers-xml'
gem "paperclip", git: 'https://github.com/thoughtbot/paperclip'
# gem 'paperclip-ffmpeg'
gem 'rqrcode_png'
gem 'dragonfly', '~> 1.0.12'
gem 'money'
gem 'monetize'
gem 'money-rails'

gem 'rubyzip', '= 1.0.0'
gem 'axlsx', '= 2.0.1'
gem 'axlsx_rails'

gem 'bcrypt', '~> 3.1.7'
gem 'jwt'
gem 'devise'
gem 'omniauth-facebook'
gem 'koala'
gem 'open_uri_redirections'

# worker
gem 'devise-async'
gem 'sidekiq'
gem 'sidekiq-cron'
# gem 'sidekiq-scheduler', '~> 2.0'

# make api
gem 'jbuilder', '~> 2.5'
gem 'jsonapi'
gem 'jsonapi-parser', '~> 0.1.1.beta2'
gem 'active_model_serializers'
gem 'rack-cors'
gem 'rack-attack'
gem 'grape'
gem 'grape-entity'
gem 'grape-swagger'
gem 'grape-swagger-rails'
gem 'grape-active_model_serializers'

# integration
gem 'redis', '~>3.2'
gem 'redis-namespace'
gem 'dalli', '~> 2.7.4'

# gem 'parse-ruby-client', git: 'https://github.com/adelevie/parse-ruby-client'
# gem 'firebase'
# gem 'gcloud'
gem 'aws-sdk', '~> 2'
gem 'omise'
gem 'mailgun'
gem 'one_signal'

gem 'slack-notifier'

# error handler
gem 'rollbar'

# marketing
gem 'meta-tags'
gem 'google-api-client'
gem 'mixpanel-ruby'
gem 'vanity'
gem 'split'

# source 'https://rails-assets.org' do
#   gem 'rails-assets-pluralize'
#   gem 'rails-assets-es6-promise'
#   gem 'rails-assets-fetch'
# end

platform :ruby do
  gem 'pg', '~> 0.18'
  gem 'puma', '~> 3.0'
  gem 'unicorn'
  gem 'mini_racer'
end

group :production do
  gem 'rails_12factor'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'

  gem 'meta_request'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  gem 'better_errors'
  gem 'binding_of_caller'

  # Deployment process
  gem 'capistrano', '~> 3.1'
  gem 'capistrano-rails', '~> 1.1'
  gem 'capistrano-bundler', '~> 1.1.2'
  gem 'capistrano-rbenv', git: 'https://github.com/capistrano/rbenv'
  gem 'airbrussh', require: false
  gem 'slackistrano', '3.1.0.beta'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :development, :test do
  gem 'byebug'
  gem 'pry'
  gem 'pry-nav'
  gem 'pry-rails'
  gem 'pry-stack_explorer'
  gem 'pry-theme'

  gem 'rspec-rails', '~> 3.0'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'ffaker'
end

group :test do
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'database_cleaner'
  gem 'guard'
  gem 'guard-rspec'
  gem 'shoulda'
  gem 'shoulda-matchers'#, '~> 3.0'
  gem 'poltergeist'
  gem 'foreman'
  gem 'launchy'
  gem 'rspec-collection_matchers'
  gem 'simplecov'
end
