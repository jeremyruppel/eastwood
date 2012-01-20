module Eastwood
  module Helpers
    extend ActiveSupport::Concern

    def application_name
      app.engine_name.camelize.sub /Application$/, ''
    end

    def env
      Rails.env
    end

    def named_routes
      app.routes.routes.select { |r| r.name.present? }
    end

    def client_routes
      Eastwood.routes.routes
    end

    protected

    def app
      Rails.application
    end
  end
end
