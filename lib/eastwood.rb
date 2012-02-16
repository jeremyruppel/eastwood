module Eastwood
  autoload :Engine,  'eastwood/engine'
  autoload :Helpers, 'eastwood/helpers'
  autoload :Routes,  'eastwood/routes'

  module Context
    autoload :Rails,  'eastwood/context/rails'
    autoload :Routes, 'eastwood/context/routes'
  end

  class << self

    def routes
      @routes ||= Routes.new
    end
  end
end

require 'eastwood/engine' if defined?(Rails)
