module Eastwood
  module Config
    extend ActiveSupport::Concern

    included do
      reset!
    end

    module ClassMethods

      def hash( name, route )
        hashes[ name ] = [ route, 'hash' ]
      end

      def path( name, route )
        paths[ name ] = [ route, 'path' ]
      end

      def url( name, route )
        urls[ name ] = [ route, 'url' ]
      end

      def custom_routes
        hashes.merge paths.merge urls
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

      protected

      def hashes
        @@hashes ||= Hash.new
      end

      def paths
        @@paths ||= Hash.new
      end

      def urls
        @@urls ||= Hash.new
      end
    end
  end
end
