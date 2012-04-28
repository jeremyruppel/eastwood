require 'spec_helper'

describe 'the Sprockets context class' do
  subject { ::Rails.application.assets.context_class.new nil, nil, nil }

  it 'should have Eastwood::Context mixed in' do
    subject.class.ancestors.should include( Eastwood::Context )
  end

  describe '#app' do
    it { should respond_to( :app ) }
    context 'by default' do
      its( :app ){ should eq( Eastwood.application_name ) }
    end
    context 'when overridden' do
      before do
        Eastwood.javascript_namespace = 'FooBar'
      end
      its( :app ){ should eq( Eastwood.javascript_namespace ) }
    end
  end

  describe '#env' do
    it { should respond_to( :env ) }
    it { should delegate( :env ).to( Eastwood, :env ) }
  end

  describe '#server_routes' do
    it { should respond_to( :server_routes ) }
    its( :server_routes ){ should be_a( Hash ) }
  end

  describe '#client_routes' do
    it { should respond_to( :client_routes ) }
    its( :client_routes ){ should be_a( Hash ) }
  end

  describe '#exports' do
    it { should respond_to( :exports ) }
    it { should delegate( :exports ).to( Eastwood, :exports ) }
  end

  describe '#target' do
    it { should respond_to( :target ) }

    context 'when #env is development' do
      before do
        subject.stub( :env ){ 'development' }
      end
      its( :target ){ should eq( 'window' ) }
    end
    context 'when #env is test' do
      before do
        subject.stub( :env ){ 'test' }
      end
      its( :target ){ should eq( '( @window = { } )' ) }
    end
    context 'when #env is production' do
      before do
        subject.stub( :env ){ 'production' }
      end
      its( :target ){ should eq( 'window' ) }
    end
    context 'when #env is something completely different' do
      before do
        subject.stub( :env ){ 'foo' }
      end
      its( :target ){ should eq( 'window' ) }
    end
  end
end

describe 'sever routes' do
  let( :context ){ ::Rails.application.assets.context_class.new nil, nil, nil }

  describe 'eastwood_engine' do
    subject { context.server_routes }
    it { should_not have_key( :eastwood_engine ) }
  end

  describe 'match' do
    subject { context.server_routes[ :match ] }

    its( :name  ){ should eq( 'match' ) }
    its( :path  ){ should eq( '/foo.:format' ) }
    its( :parts ){ should eq( [ :format ] ) }

    its( :coffee_name ){ should eq( 'match_path' ) }
    its( :coffee_path ){ should eq( '/foo#{format}' ) }
    its( :coffee_args ){ should eq( "format='.json'" ) }
  end

  describe 'match with segment' do
    subject { context.server_routes[ :match_with_segment ] }

    its( :name  ){ should eq( 'match_with_segment' ) }
    its( :path  ){ should eq( '/foo/:id.:format' ) }
    its( :parts ){ should eq( [ :id, :format ] ) }

    its( :coffee_name ){ should eq( 'match_with_segment_path' ) }
    its( :coffee_path ){ should eq( '/foo/#{id}#{format}' ) }
    its( :coffee_args ){ should eq( "id, format='.json'" ) }
  end
end

describe 'client routes' do
  let( :context ){ ::Rails.application.assets.context_class.new nil, nil, nil }

  describe 'home' do
    subject { context.client_routes[ :home ] }

    its( :name  ){ should eq( 'home' ) }
    its( :path  ){ should eq( '#/home' ) }
    its( :parts ){ should eq( [ ] ) }

    its( :coffee_name ){ should eq( 'home_hash' ) }
    its( :coffee_path ){ should eq( '#/home' ) }
    its( :coffee_args ){ should eq( '' ) }
  end

  describe 'user' do
    subject { context.client_routes[ :user ] }

    its( :name  ){ should eq( 'user' ) }
    its( :path  ){ should eq( '#/users/:id' ) }
    its( :parts ){ should eq( [ :id ] ) }

    its( :coffee_name ){ should eq( 'user_hash' ) }
    its( :coffee_path ){ should eq( '#/users/#{id}' ) }
    its( :coffee_args ){ should eq( "id" ) }
  end

  describe 'post' do
    subject { context.client_routes[ :post ] }

    its( :name  ){ should eq( 'post' ) }
    its( :path  ){ should eq( '#/users/:id/posts/:slug' ) }
    its( :parts ){ should eq( [ :id, :slug ] ) }

    its( :coffee_name ){ should eq( 'post_hash' ) }
    its( :coffee_path ){ should eq( '#/users/#{id}/posts/#{slug}' ) }
    its( :coffee_args ){ should eq( "id, slug" ) }
  end
end
