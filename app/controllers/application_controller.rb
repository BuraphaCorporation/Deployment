class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # protected
  #   def configure_permitted_parameters
  #     devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password) }
  #     devise_parameter_sanitizer.for(:user_update) { |u| u.permit(:name, :email, :password, :current_password, :is_female, :date_of_birth) }
  #   end
end
