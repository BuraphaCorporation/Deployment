require_relative "associative"

module Admin
  module Field
    class HasOne < Associative
      def self.permitted_attribute(attr)
        attr
      end
    end
  end
end
