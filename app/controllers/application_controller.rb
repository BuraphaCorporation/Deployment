class ApplicationController < ActionController::Base
  # before_action :authenticate
  protect_from_forgery with: :exception
end
