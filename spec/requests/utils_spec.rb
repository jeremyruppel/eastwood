require 'spec_helper'

describe 'eastwood/utils.js' do

  before do
    get '/assets/eastwood/utils.js'
  end

  let( :context   ){ ExecJS.compile response.body                }
  let( :namespace ){ "window.#{Eastwood.application_name}.Utils" }

  describe 'the response' do
    subject { response }

    its( :status ){ should eq( 200 ) }
    its( :content_type ){ should eq( 'text/javascript' ) }
  end

  describe 'Utils' do
    it 'should be defined' do
      context.eval( "typeof #{namespace}" ).should eq( 'object' )
    end
  end

  describe 'reduce' do
    it 'should work' do
      context.eval( "#{namespace}.reduce([1,2,3], 1, function(m,n){return m+n;})" ).should eq( 7 )
    end
  end

  describe 'keypath' do
    it 'should work' do
      context.eval( "#{namespace}.keypath( 'foo.bar', {foo:{bar:'baz'}})" ).should eq( 'baz' )
    end
  end
end
