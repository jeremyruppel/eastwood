module Eastwood
  module Config
    extend ActiveSupport::Concern

    module ClassMethods

      def hash( name, route )
        hashes[ name ] = route
      end

      def hashes
        @@hashes ||= Hash.new
      end
    end
  end
end
