require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module WadeAlike
  class Application < Rails::Application
    # Use the responders controller from the responders gem
    config.app_generators.scaffold_controller :responders_controller

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Auto-load API and its subdirectories
    # config.paths.add 'app/apis', glob: '**/*.rb'
    # config.autoload_paths += Dir["#{Rails.root}/app/apis/*"]
    config.paths.add File.join('app', 'apis'), glob: File.join('**', '*.rb')
    config.autoload_paths += Dir[Rails.root.join('app', 'apis', '*')]

    config.time_zone = 'Bangkok'
    config.active_record.default_timezone = :local
    config.active_record.time_zone_aware_types = [:datetime, :time]
    config.exceptions_app = self.routes

    config.paperclip_defaults = {
      storage:              :s3,
      s3_host_name:         "s3-ap-southeast-1.amazonaws.com",
      s3_protocol:          "https",
      url:                  ":s3_domain_url",
      path:                 "/:class/:attachment/:id_partition/:style/:filename",
      s3_credentials: {
        bucket:             ENV.fetch("S3_BUCKET_NAME"),
        access_key_id:      ENV.fetch("AWS_ACCESS_KEY_ID"),
        secret_access_key:  ENV.fetch("AWS_SECRET_ACCESS_KEY"),
        s3_region:          ENV.fetch("AWS_REGION"),
      }
    }
  end
end
