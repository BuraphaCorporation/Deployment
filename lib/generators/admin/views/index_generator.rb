require "admin/view_generator"

module Admin
  module Generators
    module Views
      class IndexGenerator < Admin::ViewGenerator
        source_root template_source_path

        def copy_template
          copy_resource_template("index")
          copy_resource_template("_collection")
        end
      end
    end
  end
end
