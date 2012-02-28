module Eastwood
  module Context
    class HashRoute < Struct.new( :key, :hash )

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
        "#{name}_hash"
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
