module Eastwood
  class Routes

    def draw( &block )
      instance_exec &block
    end

    def get( name, path )
      routes[ name ] = Route.new( name, path )
    end

    def routes
      @routes ||= { }
    end
  end

  class Route
    attr_reader :name, :path
    def initialize( name, path )
      @name, @path = name, path
    end

    def segment_keys
      # I feel like there has to be a cleaner way to do this
      path.scan( /:(\w+)/ ).flatten
    end
  end
end
