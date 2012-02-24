module Eastwood
  module Context

    class Route < Struct.new( :route )
      def name
        route.name
      end
      def verb
        'GET'
      end
      def parts
        route.parts
      end
      def path
        route.path.spec.to_s.delete '()'
      end
    end

    def app
      Rails.application.class.name.split( '::' ).first
    end

    def env
      Rails.env
    end

    def routes
      # TODO would kind of like to find a better way to transform
      # these values into my routes, but keep as a hash
      # http://www.ruby-forum.com/topic/185611
      named_routes.merge( named_routes ) { |name, route| Route.new route }
    end

    def hashes
      [ ] # TODO
    end

    protected

    def named_routes
      Rails.application.routes.named_routes.routes
    end
  end
end
