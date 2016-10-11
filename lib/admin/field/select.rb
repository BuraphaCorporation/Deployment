require_relative "base"

module Admin
  module Field
    class Select < Field::Base
      def self.searchable?
        true
      end

      def selectable_options
        collection
      end

      private

      def collection
        @collection ||= options.fetch(:collection, [])
      end
    end
  end
end
