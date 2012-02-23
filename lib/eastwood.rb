module Eastwood
  autoload :Engine,  'eastwood/engine'

  class << self
  end
end

require 'eastwood/engine' if defined?(Rails)
