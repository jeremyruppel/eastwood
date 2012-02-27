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
require 'execjs'

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
  # Reset Eastwood after each test
  config.after do
    Eastwood.reset!
  end
end

RSpec::Matchers.define :delegate do |method|
  match do |delegate|
    delegate.send method
  end
  chain :to do |receiver, method|
    @receiver, @method = receiver, method
    @receiver.should_receive( @method ){ true }
  end
  description do
    "delegate ##{method} to #{@receiver}##{@method}"
  end
  failure_message_for_should do |delegate|
    "expected that #{delegate}##{method} would delegate to #{@receiver}##{@method}"
  end
end
