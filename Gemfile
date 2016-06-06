source 'https://rubygems.org'
ruby '2.3.1'

gem 'rails', '4.2.5.2'

gem 'sass-rails'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'bower-rails'

gem 'bcrypt', '~> 3.1.7'
gem 'devise'
gem 'omniauth-facebook'

gem 'paperclip'

gem 'grape'

group :development, :test do
  gem 'pry'
  gem 'rspec-rails', '~> 3.0'
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'shoulda'
  gem 'guard'
  gem 'guard-rspec'
  gem 'database_cleaner'
end

group :development do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', '~> 0.4.0', group: :doc

  gem 'web-console', '~> 2.0'
  gem 'spring'

  # gem 'capistrano'
  # gem 'capistrano_colors'
  # gem 'quiet_assets'
  # gem 'guard-livereload', require: false
  # gem 'rack-livereload'
  # gem 'rb-fsevent', require: false

  gem 'capistrano', '~> 3.1'
  gem 'capistrano-bundler', '~> 1.1.2'
  gem 'capistrano-rails', '~> 1.1'
  gem 'capistrano-rbenv', github: 'capistrano/rbenv'
  gem 'capistrano-rails-console'
end

platform :ruby do
  gem 'pg'
  gem 'firebase'
  gem 'unicorn'
  gem 'parse-ruby-client', git: 'https://github.com/adelevie/parse-ruby-client.git'
end

group :production do
  gem 'rails_12factor'
  gem 'aws-sdk'
end

