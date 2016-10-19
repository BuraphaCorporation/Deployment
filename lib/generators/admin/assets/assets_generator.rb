require "admin/view_generator"

module Admin
  module Generators
    class AssetsGenerator < Admin::ViewGenerator
      def copy_assets
        call_generator("admin:assets:images")
        call_generator("admin:assets:javascripts")
        call_generator("admin:assets:stylesheets")
      end
    end
  end
end
