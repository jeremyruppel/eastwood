module Eastwood
  autoload :Engine, 'eastwood/engine'
end

require 'eastwood/engine' if defined?(Rails)
