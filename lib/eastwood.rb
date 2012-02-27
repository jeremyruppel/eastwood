module Eastwood
  autoload :Config,  'eastwood/config'
  autoload :Context, 'eastwood/context'
  autoload :Engine,  'eastwood/engine'
  autoload :Rails,   'eastwood/rails'

  class << self

    def configure
      yield self
    end
  end

  include Config
  include Rails
end

require 'eastwood/engine' if defined?(::Rails)
