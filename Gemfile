source 'https://rubygems.org'
ruby '2.3.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5.2'

# Use SCSS for stylesheets
gem 'sass-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development


gem 'devise'
gem 'omniauth-facebook'

gem "bower-rails"


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
  # gem 'mysql2', '>= 0.3.13', '< 0.5'
  gem 'pg'
  gem 'unicorn'
end

group :production do
  gem 'rails_12factor'
  gem 'aws-sdk'
end
