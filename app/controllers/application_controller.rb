class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :store_current_location, :unless => :devise_controller?
  before_action :default_seo
  before_action :default_cover

  http_basic_authenticate_with name: 'admin', password: 'x' if App.host == 'brick'

  def react
    @hello_world_props = { name: "Stranger" }
    render template: 'layouts/react'
  end

protected
  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

  def redirect_back
    redirect_to :back
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, :password])
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


  def set_seo_title(title)
    set_meta_tags title: "#{title} - Daydash"
  end

  def default_seo
    site_name   = "daydash.co"
    url         = request.original_url
    title       = "Daydash - Discover activities and events in Bangkok every day"
    description = "ค้นพบกิจกรรมและอีเว้นท์สนุกๆ ในกรุงเทพฯ ที่พร้อมให้คุณมาทดลองและสัมผัสประสบการณ์ใหม่ได้ทุกวัน ไม่ว่าจะเป็น Live Music, DJ, Party, Craft & Art Workshop, Beer Tasting, Cool Exhbition ไปจนถึง Fitness, Sport, Outdoor activity etc."
    image       = "#{App.domain}/facebook-og.jpg"

    set_meta_tags title:  title,
      description:        description,
      keywords:           description,
      image:              image,
      fb: {
        app_id:           App.configure.facebook_app_id
      },
      og: {
        title:            title,
        type:             'website',
        url:              request.original_url,
        image: {
          _:              image,
          url:            image,
          width:          1200,
          height:         630,
        }
      },
      twitter: {
        title:            title,
        site:             site_name,
        image: {
          _:              image,
          url:            image,
          width:          1200,
          height:         630,
        },
        card:             'summary_large_image'
      }
  end

  def default_cover
    @covers = [
      {
        image: '/src/images/content/cover-1.jpg',
        caption: '<h1 class="title">ประสบการณ์ใหม่ๆ มีอยู่รอบตัว</h1><div class="subtitle">Daydash ค้นพบกิจกรรมสนุกๆ อีเว้นท์เจ๋งๆ ที่พร้อมให้คุณออกไปสัมผัสได้ทุกวัน</div>'
      }
    ]
  end

  def set_current_page(page)
    @set_page = page
  end
end
