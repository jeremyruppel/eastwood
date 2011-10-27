require 'test_helper'

class HelpersContext
  include Eastwood::Helpers
end

class Eastwood::HelpersTest < ActiveSupport::TestCase
  
  setup do
    @context = HelpersContext.new
  end
  
  # application_name
  
  test "should define application_name" do
    assert_respond_to @context, :application_name
  end
  test "should return the application name" do
    assert_equal @context.application_name, 'Dummy'
  end
  
  # env
  
  test "should define env" do
    assert_respond_to @context, :env
  end
  test "should return the current environment" do
    assert_equal @context.env, 'test'
  end
  
end
