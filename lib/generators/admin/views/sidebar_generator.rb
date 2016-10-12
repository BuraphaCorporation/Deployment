require "admin/view_generator"

module Admin
  module Generators
    module Views
      class SidebarGenerator < Admin::ViewGenerator
        source_root template_source_path

        def copy_sidebar
          copy_resource_template("_sidebar")
        end
      end
    end
  end
end
