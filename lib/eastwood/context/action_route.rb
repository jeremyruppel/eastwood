module Eastwood
  module Context
    class ActionRoute < Struct.new( :route, :format )
      include RouteHelpers

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
        style "#{name}_path"
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
