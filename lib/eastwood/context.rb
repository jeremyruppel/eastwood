module Eastwood
  module Context

    class Route < Struct.new( :route, :format )
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

    def app
      Rails.application.class.name.split( '::' ).first
    end

    def env
      Rails.env
    end

    def target
      env === 'test' ? '( @window = { } )' : 'window'
    end

    def routes
      # TODO would kind of like to find a better way to transform
      # these values into my routes, but keep as a hash
      # http://www.ruby-forum.com/topic/185611
      named_routes.merge( named_routes ) { |key, route| Route.new route, route_format }
    end

    def hashes
      # TODO would kind of like to find a better way to transform
      # these values into my routes, but keep as a hash
      # http://www.ruby-forum.com/topic/185611
      named_hashes.merge( named_hashes ){ |key, hash| HashRoute.new key, hash }
    end

    def route_format
      omit_route_format? ? '' : ".#{Eastwood.default_route_format.to_s}"
    end

    protected

    def omit_route_format?
      [ '', false ].include? Eastwood.default_route_format
    end

    def named_hashes
      Eastwood.hashes
    end

    def named_routes
      Rails.application.routes.named_routes.routes
    end
  end
end
