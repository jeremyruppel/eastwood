module Eastwood
  module Context
    module RouteHelpers

      def style_for_javascript( route )
        case Eastwood.javascript_route_style.to_sym
        when :underscore
          route.underscore
        when :camelcase
          route.camelcase :lower
        else
          raise InvalidRouteStyleError
        end
      end
    end
  end
end
