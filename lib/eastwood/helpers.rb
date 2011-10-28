module Eastwood
  module Helpers
    extend ActiveSupport::Concern
    
    module InstanceMethods
      
      def application_name
        app.engine_name.camelize.delete 'Application'
      end
      
      def env
        Rails.env
      end
      
      def named_routes
        app.routes.routes.select { |r| r.name.present? }
      end
      
      protected
      
      def app
        Rails.application
      end
    end
  end
end
