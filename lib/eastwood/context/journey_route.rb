module Eastwood
  module Context
    class JourneyRoute < Struct.new( :route, :format )

      def name
        route.name
      end

      def parts
        route.parts
      end

      def path
        route.path.spec.to_s.delete '()'
      end

      def coffee_name
        "#{name}_path"
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
