require_relative "base"

module Admin
  module Field
    class Text < Admin::Field::Base
      def self.searchable?
        false
      end

      def truncate
        data.to_s[0...truncation_length]
      end

      private

      def truncation_length
        options.fetch(:truncate, 50)
      end
    end
  end
end
