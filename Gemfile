source 'https://rubygems.org'
ruby '2.3.1'

gem 'rails', '4.2.5.2'

gem 'sprockets'
gem 'sprockets-es6'
gem 'sass-rails'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'react-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'bower-rails'
gem 'bcrypt', '~> 3.1.7'

gem 'devise'
gem 'omniauth-facebook'

gem 'paperclip'

gem 'active_model_serializers'

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
  gem 'web-console', '~> 2.0'
  gem 'spring'

  gem 'capistrano', '~> 3.1'
  gem 'capistrano-bundler', '~> 1.1.2'
  gem 'capistrano-rails', '~> 1.1'
  gem 'capistrano-rbenv', github: 'capistrano/rbenv'
  gem 'capistrano-rails-console'

  gem 'airbrussh', require: false
end

platform :ruby do
  gem 'pg'
  gem 'redis'
  gem 'firebase'
  gem 'unicorn'
  gem 'parse-ruby-client', git: 'https://github.com/adelevie/parse-ruby-client.git'
end

group :production do
  gem 'rails_12factor'
  gem 'aws-sdk'
end
