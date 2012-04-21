module Eastwood
  module Context
    class ClientRoute < Struct.new( :key, :hash )
      include RouteHelpers

      def name
        key.to_s
      end

      def parts
        hash.scan( /:(\w+)/ ).flatten.map &:to_sym
      end

      def path
        hash
      end

      def coffee_name
        style_for_javascript "#{name}_hash"
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
