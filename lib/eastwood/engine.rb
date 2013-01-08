module Eastwood
  class Engine < ::Rails::Engine

    initializer 'eastwood.setup', :group => :all do |app|
      # include helpers in the sprockets context
      app.assets.context_class.instance_eval do
        include Eastwood::Context
      end
    end
  end
end
