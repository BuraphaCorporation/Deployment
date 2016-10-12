require "rails/generators/base"

module Admin
  module Generators
    module Assets
      class JavascriptsGenerator < Rails::Generators::Base
        JAVASCRIPTS_PATH = "app/assets/javascripts/admin"

        source_root File.expand_path("../../../../../", __FILE__)

        def copy_javascripts
          directory JAVASCRIPTS_PATH, JAVASCRIPTS_PATH
        end
      end
    end
  end
end
