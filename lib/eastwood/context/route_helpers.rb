module Eastwood
  module Context
    module RouteHelpers

      def style( route )
        case Eastwood.javascript_route_style.to_sym
        when :underscore
          route.underscore
        when :camelcase
          route.camelcase :lower
        end
      end
    end
  end
end
