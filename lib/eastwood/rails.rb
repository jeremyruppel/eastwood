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
        ::Rails.application.routes.named_routes.routes
      end
    end
  end
end
