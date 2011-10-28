module Eastwood
  module Helpers
    extend ActiveSupport::Concern
    
    module InstanceMethods
      
      def application_name
        Rails.application.engine_name.camelize.delete 'Application'
      end
      
      def env
        Rails.env
      end
      
      def named_routes
        Rails.application.routes.routes.select { |r| r.name.present? }
      end
    end
  end
end
