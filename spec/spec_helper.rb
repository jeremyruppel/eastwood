# Set the environment variables for the test app
ENV[ 'RAILS_ENV' ] = 'test'
# ENV[ 'RAILS_ROOT' ] =

# Add the test app to the load path
$: << ENV[ 'EASTWOOD_RAILS_PATH' ]

# Require all dependencies
Bundler.require

# Boot the rails app
require 'config/environment'

# Require test dependencies *after* rails
require 'rspec/rails'
require 'shoulda'

# Define some helpers
module ResponseBodyHelper
  def the_response_body
    JSON.parse response.body, :symbolize_names => true
  end
end

# Configure RSpec
RSpec.configure do |config|
  # Use color
  config.color_enabled = true
  # Change the formatter
  config.formatter = :documentation
  # Include those helpers
  config.include ResponseBodyHelper
end
