module Eastwood
  module Context
    module Routes

      def named_routes
        app.routes.routes.select { |r| r.name.present? }
      end

      def client_routes
        Eastwood.routes.routes
      end
    end
  end
end
