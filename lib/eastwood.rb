module Eastwood
  autoload :Config,  'eastwood/config'
  autoload :Context, 'eastwood/context'
  autoload :Engine,  'eastwood/engine'
  autoload :Rails,   'eastwood/rails'

  module Context
    autoload :ActionRoute,  'eastwood/context/action_route'
    autoload :JourneyRoute, 'eastwood/context/journey_route'
    autoload :HashRoute,    'eastwood/context/hash_route'
  end

  class << self

    def configure
      yield self
    end
  end

  include Config
  include Rails
end

require 'eastwood/engine' if defined?(::Rails)
