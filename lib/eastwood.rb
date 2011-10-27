module Eastwood
  autoload :Engine, 'eastwood/engine'
  autoload :Helpers, 'eastwood/helpers'
end

require 'eastwood/engine' if defined?(Rails)
