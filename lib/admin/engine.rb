# require "datetime_picker_rails"
# require "jquery-rails"
# require "kaminari"
# require "momentjs-rails"
# require "neat"
# require "normalize-rails"
# require "sass-rails"
# require "selectize-rails"
# require "sprockets/railtie"

require "admin/page/form"
require "admin/page/show"
require "admin/page/collection"
require "admin/order"
require "admin/resource_resolver"
require "admin/search"
require "admin/namespace"

module Admin
  class Engine < ::Rails::Engine
    isolate_namespace Admin

    @@javascripts = []
    @@stylesheets = []

    Engine.config.assets.precompile << /\.(?:svg)\z/

    def self.add_javascript(script)
      @@javascripts << script
    end

    def self.add_stylesheet(stylesheet)
      @@stylesheets << stylesheet
    end

    def self.stylesheets
      @@stylesheets
    end

    def self.javascripts
      @@javascripts
    end

    add_javascript "admin/application"
    add_stylesheet "admin/application"
  end
end
