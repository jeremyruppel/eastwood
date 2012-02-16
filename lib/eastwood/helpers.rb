module Eastwood
  module Helpers
    extend ActiveSupport::Concern

    include Eastwood::Context::Rails
    include Eastwood::Context::Routes
  end
end
