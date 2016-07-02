source 'https://rubygems.org'
ruby '2.3.1'

gem 'rails', '5.0'

gem 'sass-rails'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
# gem 'sprockets'
# gem 'sprockets-es6'
gem 'react-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bower-rails'
gem 'bcrypt', '~> 3.1.7'

gem 'devise'
gem 'omniauth-facebook'

gem 'paperclip'

gem 'active_model_serializers'
gem 'rails-controller-testing'
gem 'activemodel-serializers-xml'

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
  gem 'capistrano-bundler', '~> 1.1.2'
  gem 'capistrano-rails', '~> 1.1'
  gem 'capistrano-rbenv', github: 'capistrano/rbenv'
  gem 'capistrano-rails-console'

  gem 'airbrussh', require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

platform :ruby do
  gem 'pg'
  gem 'puma'
  gem 'redis'
  gem 'firebase'
  gem 'unicorn'
  gem 'parse-ruby-client', git: 'https://github.com/adelevie/parse-ruby-client.git'
end

group :production do
  gem 'rails_12factor'
  gem 'aws-sdk'
end
