require 'spec_helper'

describe Eastwood do

  describe '#configure' do
    it { should respond_to( :configure ) }

    it 'should yield itself to the configure block' do
      Eastwood.configure do |config|
        config.should eq( Eastwood )
      end
    end
  end

  describe '#reset!' do
    it { should respond_to( :reset! ) }

    it 'should reset all configurations' do
      Eastwood.default_route_format.should eq( :json )
      Eastwood.default_route_format = :xml
      Eastwood.default_route_format.should eq( :xml )
      Eastwood.reset!
      Eastwood.default_route_format.should eq( :json )
    end
  end

  describe '#excludes' do
    it { should respond_to( :excludes ) }
    its( :excludes ){ should be_an( Array ) }
    its( :excludes ){ should include( /eastwood_engine/ ) }
  end

  describe '#hash' do
    it { should respond_to( :hash ) }

    describe 'adding a hash' do
      before do
        Eastwood.hash :myhash, '#/bar'
      end

      subject { Eastwood.custom_routes }

      it { should include( :myhash => [ '#/bar', 'hash' ] ) }
    end
  end

  describe '#path' do
    it { should respond_to( :path ) }

    describe 'adding a path' do
      before do
        Eastwood.path :mypath, '/foo/bar'
      end

      subject { Eastwood.custom_routes }

      it { should include( :mypath => [ '/foo/bar', 'path' ] ) }
    end
  end

  describe '#url' do
    it { should respond_to( :url ) }

    describe 'adding a url' do
      before do
        Eastwood.url :myurl, 'http://www.foo.com'
      end

      subject { Eastwood.custom_routes }

      it { should include( :myurl => [ 'http://www.foo.com', 'url' ] ) }
    end
  end

  describe '#export' do
    it { should respond_to( :export ) }

    describe 'adding exports' do
      before do
        Eastwood.export :foo => 'bar', :baz => 'qux'
      end

      subject { Eastwood.exports }

      it { should include( :foo => 'bar', :baz => 'qux' ) }
    end

    describe 'overwriting an export' do
      before do
        Eastwood.export :foo => 'bar'
        Eastwood.export :foo => 'baz'
      end

      subject { Eastwood.exports }

      it { should include( :foo => 'baz' ) }
    end
  end

  describe '#default_route_format' do
    it { should respond_to( :default_route_format ) }

    it 'should default to :json' do
      Eastwood.default_route_format.should eq( :json )
    end
  end

  describe '#javascript_route_style' do
    it { should respond_to( :javascript_route_style ) }

    it 'should default to :underscore' do
      Eastwood.javascript_route_style.should eq( :underscore )
    end
  end

  describe '#javascript_namespace' do
    it { should respond_to( :javascript_namespace ) }

    it 'should default to nil' do
      Eastwood.javascript_namespace.should eq( nil )
    end
  end
end
