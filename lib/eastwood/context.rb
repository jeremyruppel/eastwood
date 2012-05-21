module Eastwood
  module Context

    def app
      Eastwood.javascript_namespace or Eastwood.application_name
    end

    def env
      Eastwood.env
    end

    def target
      env === 'test' ? '( @window ||= { } )' : 'window'
    end

    def server_routes
      # TODO would kind of like to find a better way to transform
      # these values into my routes, but keep as a hash
      # http://www.ruby-forum.com/topic/185611
      named_routes.merge( named_routes ) { |key, route| route_class.new route, route_format }
    end

    def client_routes
      # TODO would kind of like to find a better way to transform
      # these values into my routes, but keep as a hash
      # http://www.ruby-forum.com/topic/185611
      custom_routes.merge( custom_routes ){ |key, (route, suffix)| ClientRoute.new key, route, suffix }
    end

    def exports
      Eastwood.exports
    end

    def route_format
      omit_route_format? ? '' : ".#{Eastwood.default_route_format.to_s}"
    end

    protected

    def route_class
      defined?(Journey) ? JourneyRoute : ActionRoute
    end

    def omit_route_format?
      [ '', false ].include? Eastwood.default_route_format
    end

    def custom_routes
      Eastwood.custom_routes
    end

    def named_routes
      Eastwood.named_routes
    end
  end
end
