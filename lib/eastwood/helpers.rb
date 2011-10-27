module Eastwood
  module Helpers
    extend ActiveSupport::Concern
    
    module InstanceMethods
      
      def application_name
        Rails.application.engine_name.camelize.delete 'Application'
      end
    end
  end
end
