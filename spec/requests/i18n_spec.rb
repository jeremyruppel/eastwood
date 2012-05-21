require 'spec_helper'

describe 'eastwood/i18n.js' do

  before do
    get '/assets/eastwood/i18n.js'
  end

  let( :context   ){ ExecJS.compile response.body          }
  let( :namespace ){ "window.#{Eastwood.application_name}" }

  describe 'the response' do
    subject { response }

    its( :status ){ should eq( 200 ) }
    its( :content_type ){ should eq( 'text/javascript' ) }
  end

  describe 'locale' do
    it 'should be "en"' do
      context.eval( "#{namespace}.I18n.locale" ).should eq( 'en' )
    end
  end

  describe 'translations' do
    it 'should be defined' do
      context.eval( "typeof #{namespace}.I18n.en" ).should eq( 'object' )
    end

    it 'should provide hello world' do
      context.eval( "#{namespace}.I18n.t( 'hello' )" ).should eq( 'Hello world' )
    end

    it 'should provide nested translations' do
      context.eval( "#{namespace}.I18n.t( 'time.pm' )" ).should eq( 'pm' )
    end
  end
end
