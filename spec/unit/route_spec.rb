require 'spec_helper'

shared_examples 'a route adapter' do
  subject { described_class.new( route, 'json' ) }

  it { should respond_to( :name ) }
  it { should respond_to( :parts ) }
  it { should respond_to( :path ) }
  it { should respond_to( :coffee_name ) }
  it { should respond_to( :coffee_args ) }
  it { should respond_to( :coffee_path ) }

  its( :name        ){ should eq( 'foo' )                         }
  its( :parts       ){ should eq( [ :bar, :baz, :format ] )       }
  its( :path        ){ should eq( '/foo/:bar/:baz.:format' )      }
  its( :coffee_args ){ should eq( "bar, baz, format='json'" )     }
  its( :coffee_path ){ should eq( '/foo/#{bar}/#{baz}#{format}' ) }

  context 'when javascript_route_style is :underscore' do
    before do
      Eastwood.javascript_route_style = :underscore
    end
    its( :coffee_name ){ should eq( 'foo_path' ) }
  end

  context 'when javascript_route_style is :camelcase' do
    before do
      Eastwood.javascript_route_style = :camelcase
    end
    its( :coffee_name ){ should eq( 'fooPath' ) }
  end
end

describe Eastwood::Context::ActionRoute do
  it_behaves_like 'a route adapter' do
    let( :route ){ double 'route' } # ActionDispatch::Routing::Route
    before do
      route.stub( :name         ){ 'foo'                      }
      route.stub( :segment_keys ){ [ :bar, :baz, :format ]    }
      route.stub( :path         ){ '/foo/:bar/:baz(.:format)' }
    end
  end
end

describe Eastwood::Context::JourneyRoute do
  it_behaves_like 'a route adapter' do
    let( :route ){ double 'route' } # Journey::Route
    before do
      route.stub( :name  ){ 'foo'                   }
      route.stub( :parts ){ [ :bar, :baz, :format ] }
      route.stub_chain( :path, :spec, :to_s => '/foo/:bar/:baz(.:format)' )
    end
  end
end
