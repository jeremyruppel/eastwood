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
  end
end
