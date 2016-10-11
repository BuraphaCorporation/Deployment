require_relative "associative"

module Admin
  module Field
    class Polymorphic < Associative
      protected

      def associated_dashboard
        "#{data.class.name}Dashboard".constantize.new
      end
    end
  end
end
