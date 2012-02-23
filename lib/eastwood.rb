module Eastwood
  autoload :Config, 'eastwood/config'
  autoload :Engine, 'eastwood/engine'

  class << self

    def configure
      yield self
    end
  end

  include Config
end

require 'eastwood/engine' if defined?(Rails)
