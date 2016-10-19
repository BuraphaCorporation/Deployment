require_relative "base"

module Admin
  module Field
    class Email < Field::Base
      def self.searchable?
        true
      end
    end
  end
end
