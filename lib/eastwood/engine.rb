module Eastwood
  class Engine < Rails::Engine

    initializer 'eastwood.setup' do |app|
      app.assets.context_class.instance_eval do
        include Eastwood::Context
      end
    end
  end
end
