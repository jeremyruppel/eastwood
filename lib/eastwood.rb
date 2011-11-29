module Eastwood
  autoload :Engine,  'eastwood/engine'
  autoload :Helpers, 'eastwood/helpers'
  autoload :Routes,  'eastwood/routes'

  class << self

    def routes
      @routes ||= Routes.new
    end
  end
end

require 'eastwood/engine' if defined?(Rails)
