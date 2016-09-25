class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  skip_after_action :intercom_rails_auto_include

  before_action :store_current_location, :unless => :devise_controller?
  before_action :seo

protected
  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

  def redirect_back
    redirect_to :back
  end

  def store_current_location
    # store last url as long as it isn't a /users path
    store_location_for(:user, request.url)
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

  def after_sign_out_path_for(resource)
    root_path
    # request.referrer || root_path
  end

  def global_categories
    @global_categories = Category.all
  end

  def seo
    @seo_title       = "Discover activities and events in Bangkok every day"
    @seo_description = "ค้นพบกิจกรรมและอีเว้นท์สนุกๆ ในกรุงเทพฯ ที่พร้อมให้คุณมาทดลองและสัมผัสประสบการณ์ใหม่ได้ทุกวัน ไม่ว่าจะเป็น Live Music, DJ, Party, Craft & Art Workshop, Beer Tasting, Cool Exhbition ไปจนถึง Fitness, Sport, Outdoor activity etc."
    @seo_image       = "#{App.domain}/facebook-og.jpg"
  end
end
