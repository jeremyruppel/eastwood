module Eastwood
  module Rails
    extend ActiveSupport::Concern

    module ClassMethods

      def application_name
        # TODO store
        ::Rails.application.class.name.split( '::' ).first
      end

      def env
        ::Rails.env
      end

      def named_routes
        rails_routes.reject { |route| excludes.any? { |pattern| pattern.match( route ) } }
      end

      protected

      def rails_routes
        ::Rails.application.routes.named_routes.routes
      end
    end
  end
end
