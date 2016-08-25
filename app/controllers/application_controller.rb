class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  skip_after_action :intercom_rails_auto_include

  protected
    def not_found
      raise ActionController::RoutingError.new('Not Found')
    end

    def after_sign_in_path_for(resource)
      if resource.sign_in_count == 1
        # welcome_path
        root_path
      else
        request.env['omniauth.origin'] || stored_location_for(resource) || root_path
      end
    end

  #   def configure_permitted_parameters
  #     devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password) }
  #     devise_parameter_sanitizer.for(:user_update) { |u| u.permit(:name, :email, :password, :current_password, :is_female, :date_of_birth) }
  #   end
end
