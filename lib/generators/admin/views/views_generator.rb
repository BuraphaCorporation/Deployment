require "admin/view_generator"

module Admin
  module Generators
    class ViewsGenerator < Admin::ViewGenerator
      def copy_templates
        call_generator("admin:views:index", resource_path)
        call_generator("admin:views:show", resource_path)
        call_generator("admin:views:new", resource_path)
        call_generator("admin:views:edit", resource_path)
      end
    end
  end
end
