module Eastwood
  module Context

    def app
      Rails.application.class.name.split( '::' ).first
    end

    def env
      Rails.env
    end
  end
end
