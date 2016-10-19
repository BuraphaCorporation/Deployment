require "admin/view_generator"

module Admin
  module Generators
    module Views
      class ShowGenerator < Admin::ViewGenerator
        source_root template_source_path

        def copy_template
          copy_resource_template("show")
        end
      end
    end
  end
end
