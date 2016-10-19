require "admin/view_generator"

module Admin
  module Generators
    module Views
      class NewGenerator < Admin::ViewGenerator
        source_root template_source_path

        def copy_new
          copy_resource_template("new")
          copy_resource_template("_form")
        end
      end
    end
  end
end
