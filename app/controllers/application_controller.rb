class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  skip_after_action :intercom_rails_auto_include

protected
  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

  def redirect_back
    redirect_to :back
  end

  def after_sign_in_path_for(resource)
    # if resource.sign_in_count <= 1
    #   # welcome_path
    #   root_path
    # else
    #   # root_path
    request.env['omniauth.origin'] || stored_location_for(resource) || root_path
    # end
  end

  def global_categories
    @global_categories = Category.all
  end
end
