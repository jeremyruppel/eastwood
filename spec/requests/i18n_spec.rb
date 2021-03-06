require 'spec_helper'

describe 'eastwood/i18n.js' do

  before do
    get '/assets/eastwood/i18n.js'
  end

  let( :context   ){ ExecJS.compile response.body               }
  let( :namespace ){ "window.#{Eastwood.application_name}.I18n" }

  describe 'the response' do
    subject { response }

    its( :status ){ should eq( 200 ) }
    its( :content_type ){ should eq( 'text/javascript' ) }
  end

  describe 'locale' do
    it 'should be "en"' do
      context.eval( "#{namespace}.locale" ).should eq( 'en' )
    end
  end

  describe 'translations' do
    it 'should be defined' do
      context.eval( "typeof #{namespace}.en" ).should eq( 'object' )
    end

    it 'should provide hello world' do
      context.eval( "#{namespace}.t( 'hello' )" ).should eq( 'Hello world' )
    end

    it 'should provide nested translations' do
      context.eval( "#{namespace}.t( 'time.pm' )" ).should eq( 'pm' )
    end

    it 'should interpolate translations' do
      key = "activerecord.errors.messages.record_invalid"
      obj = "{errors:'foo!'}"

      context.eval( "#{namespace}.t( '#{key}', #{obj})" ).should eq( 'Validation failed: foo!' )
    end

    it 'should handle missing translations' do
      context.eval( "#{namespace}.t( 'foo' )"     ).should eq( 'translation missing: en.foo' )
      context.eval( "#{namespace}.t( 'foo.bar' )" ).should eq( 'translation missing: en.foo.bar' )
    end
  end
end
