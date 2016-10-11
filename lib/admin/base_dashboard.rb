require "admin/field/belongs_to"
require "admin/field/boolean"
require "admin/field/date_time"
require "admin/field/email"
require "admin/field/has_many"
require "admin/field/has_one"
require "admin/field/number"
require "admin/field/polymorphic"
require "admin/field/select"
require "admin/field/string"
require "admin/field/text"

module Admin
  class BaseDashboard
    include Admin

    def attribute_types
      self.class::ATTRIBUTE_TYPES
    end

    def attribute_type_for(attribute_name)
      attribute_types.fetch(attribute_name) do
        fail attribute_not_found_message(attribute_name)
      end
    end

    def attribute_types_for(attribute_names)
      attribute_names.each_with_object({}) do |name, attributes|
        attributes[name] = attribute_type_for(name)
      end
    end

    def form_attributes
      self.class::FORM_ATTRIBUTES
    end

    def permitted_attributes
      form_attributes.map do |attr|
        attribute_types[attr].permitted_attribute(attr)
      end.uniq
    end

    def show_page_attributes
      self.class::SHOW_PAGE_ATTRIBUTES
    end

    def collection_attributes
      self.class::COLLECTION_ATTRIBUTES
    end

    def display_resource(resource)
      "#{resource.class} ##{resource.id}"
    end

    private

    def attribute_not_found_message(attr)
      "Attribute #{attr} could not be found in #{self.class}::ATTRIBUTE_TYPES"
    end
  end
end
