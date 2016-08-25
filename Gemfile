source 'https://rubygems.org'
ruby '2.3.1'

gem 'rails', '5.0.0.1'

# helper views
gem 'turbolinks', '~> 5'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'sprockets'
gem 'sprockets-es6'
gem 'jquery-rails'
gem 'react-rails'
gem 'slick_rails'
gem 'momentjs-rails'
# gem 'bootstrap-sass'
# gem 'autoprefixer-rails'
gem 'cocoon'

# helper model
gem 'figaro'
gem 'annotate'
gem 'bcrypt', '~> 3.1.7'
gem 'paranoia', github: 'rubysherpas/paranoia', branch: 'rails5'
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

# make api
gem 'jbuilder', '~> 2.5'
gem 'grape'
gem 'grape-entity'
gem 'grape-swagger'
gem 'grape-swagger-rails'
gem 'grape-active_model_serializers'

# nosql
gem 'redis', '~>3.2'
gem 'dalli', '~> 2.7.4'
gem 'firebase'
gem 'parse-ruby-client', git: 'https://github.com/adelevie/parse-ruby-client.git'

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
# gem "devise-async"

# error handler
gem 'rollbar'

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
  # gem 'capistrano3-puma'
  gem 'capistrano-rails', '~> 1.1'
  gem 'capistrano-bundler', '~> 1.1.2'
  gem 'capistrano-rbenv', github: 'capistrano/rbenv'
  gem 'capistrano-rails-console'
  gem 'slackistrano', '3.1.0.beta'

  gem 'airbrussh', require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

platform :ruby do
  gem 'pg'
  gem 'puma'
  gem 'unicorn'
end

group :production do
  gem 'rails_12factor'
end
