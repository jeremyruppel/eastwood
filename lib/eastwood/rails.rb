module Eastwood
  module Rails
    extend ActiveSupport::Concern

    module ClassMethods

      def application_name
        ::Rails.application.class.name.split( '::' ).first
      end
    end
  end
end
