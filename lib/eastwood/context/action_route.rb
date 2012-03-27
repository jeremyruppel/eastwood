module Eastwood
  module Context
    class ActionRoute < Struct.new( :route, :format )

      def name
        route.name
      end

      def parts
        route.segment_keys
      end

      def path
        route.path.delete '()'
      end

      def coffee_name
        case Eastwood.javascript_route_style.to_sym
        when :underscore
          "#{name}_path".underscore
        when :camelcase
          "#{name}_path".camelcase :lower
        end
      end

      def coffee_args
        parts.any? ? "#{parts.join( ', ' )}='#{format}'" : ''
      end

      def coffee_path
        path.delete( '.' ).gsub /:(\w+)/, '#{\1}'
      end
    end
  end
end
