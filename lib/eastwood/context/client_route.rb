module Eastwood
  module Context
    class ClientRoute < Struct.new( :key, :route, :suffix )
      include RouteHelpers

      def name
        key.to_s
      end

      def parts
        route.scan( /:(\w+)/ ).flatten.map &:to_sym
      end

      def path
        route
      end

      def coffee_name
        style_for_javascript "#{name}_#{suffix}"
      end

      def coffee_args
        parts.join ', '
      end

      def coffee_path
        path.gsub /:(\w+)/, '#{\1}'
      end
    end
  end
end
