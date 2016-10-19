require "admin/view_generator"

module Admin
  module Generators
    module Views
      class LayoutGenerator < Admin::ViewGenerator
        source_root template_source_path

        def copy_template
          copy_file(
            "../../layouts/admin/application.html.erb",
            "app/views/layouts/admin/application.html.erb",
          )

          call_generator("admin:views:sidebar")
          copy_resource_template("_javascript")
          copy_resource_template("_flashes")
        end
      end
    end
  end
end
