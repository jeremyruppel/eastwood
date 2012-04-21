module Eastwood
  module Config
    extend ActiveSupport::Concern

    included do
      reset!
    end

    module ClassMethods

      def hash( name, route )
        hashes[ name ] = route
      end

      def hashes
        @@hashes ||= Hash.new
      end

      def export( *args )
        exports.merge! *args
      end

      def exports
        @@exports ||= Hash.new
      end

      mattr_accessor :default_route_format
      mattr_accessor :javascript_route_style
      mattr_accessor :javascript_namespace

      def reset!
        @@default_route_format   = :json
        @@javascript_route_style = :underscore
        @@javascript_namespace   = nil
      end
    end
  end
end
