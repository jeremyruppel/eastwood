require 'test_helper'

class AssetTest < ActionDispatch::IntegrationTest
  
  test "should provide an eastwood.js asset" do
    get '/assets/eastwood.js'
    assert_response :success
    puts response.body
  end
end
