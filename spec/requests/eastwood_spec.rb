require 'spec_helper'

describe 'eastwood.js' do

  before do
    get '/assets/eastwood.js'
  end

  let( :context   ){ ExecJS.compile response.body          }
  let( :namespace ){ "window.#{Eastwood.application_name}" }
  let( :routes    ){ "#{namespace}.routes"                 }
  let( :exports   ){ "#{namespace}.exports"                }

  describe 'the response' do
    subject { response }

    its( :status ){ should eq( 200 ) }
    its( :content_type ){ should eq( 'text/javascript' ) }
  end

  describe 'eastwood_engine_path' do
    it 'should be defined' do
      context.eval( "typeof #{routes}.eastwood_engine_path" ).should eq( 'function' )
    end
    it 'should return the correct route' do
      context.call( "#{routes}.eastwood_engine_path" ).should eq( '/eastwood' )
    end
  end

  describe 'match_path' do
    it 'should be defined' do
      context.eval( "typeof #{routes}.match_path" ).should eq( 'function' )
    end
    it 'should return the correct route' do
      context.call( "#{routes}.match_path" ).should eq( '/foo.json' )
    end
    it 'should accept a format to override' do
      context.call( "#{routes}.match_path", '.html' ).should eq( '/foo.html' )
    end
  end

  describe 'match_with_segment_path' do
    it 'should be defined' do
      context.eval( "typeof #{routes}.match_with_segment_path" ).should eq( 'function' )
    end
    it 'should return the correct route' do
      context.call( "#{routes}.match_with_segment_path", 'bar' ).should eq( '/foo/bar.json' )
    end
    it 'should accept a format to override' do
      context.call( "#{routes}.match_with_segment_path", 'bar', '.html' ).should eq( '/foo/bar.html' )
    end
  end

  describe 'home_hash' do
    it 'should be defined' do
      context.eval( "typeof #{routes}.home_hash" ).should eq( 'function' )
    end
    it 'should return the correct hash' do
      context.call( "#{routes}.home_hash" ).should eq( '#/home' )
    end
  end

  describe 'user_hash' do
    it 'should be defined' do
      context.eval( "typeof #{routes}.user_hash" ).should eq( 'function' )
    end
    it 'should return the correct hash' do
      context.call( "#{routes}.user_hash", 'foo' ).should eq( '#/users/foo' )
    end
  end

  describe 'post_hash' do
    it 'should be defined' do
      context.eval( "typeof #{routes}.post_hash" ).should eq( 'function' )
    end
    it 'should return the correct hash' do
      context.call( "#{routes}.post_hash", 'foo', 'bar' ).should eq( '#/users/foo/posts/bar' )
    end
  end

  describe 'exports' do
    it 'should be defined' do
      context.eval( "typeof #{exports}" ).should eq( 'object' )
    end
  end
end
