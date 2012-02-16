module Eastwood
  module Context
    module Rails

      def application_name
        app.engine_name.camelize.sub /Application$/, ''
      end

      def env
        ::Rails.env
      end

      def app
        ::Rails.application
      end
    end
  end
end
