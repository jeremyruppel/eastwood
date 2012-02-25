module Eastwood
  class Engine < Rails::Engine

    initializer 'eastwood.setup' do |app|
      # include helpers in the sprockets context
      app.assets.context_class.instance_eval do
        include Eastwood::Context
      end
      # watch for changes in eastwood initializer
      app.config.watchable_files << 'config/initializers/eastwood.rb'
    end
  end
end
