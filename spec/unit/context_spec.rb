require 'spec_helper'

describe 'the Sprockets context class' do

  subject { Rails.application.assets.context_class.new nil, nil, nil }

  it 'should have Eastwood::Context mixed in' do
    subject.class.ancestors.should include( Eastwood::Context )
  end

  describe '#app' do
    it { should respond_to( :app ) }
    its( :app ){ should eq( Rails.application.class.name.split( '::' ).first ) }
  end

  describe '#env' do
    it { should respond_to( :env ) }
    its( :env ){ should eq( Rails.env ) }
  end

  describe '#routes' do
    it { should respond_to( :routes ) }
    its( :routes ){ should be_a( Hash ) }
  end

  describe '#hashes' do
    it { should respond_to( :hashes ) }
  end
end

describe 'routes' do
  let( :context ){ Rails.application.assets.context_class.new nil, nil, nil }

  describe 'eastwood_engine' do
    subject { context.routes[ :eastwood_engine ] }

    its( :name  ){ should eq( 'eastwood_engine' ) }
    its( :path  ){ should eq( '/eastwood' ) }
    its( :parts ){ should eq( [ ] ) }

    its( :coffee_name ){ should eq( 'eastwood_engine_path' ) }
    its( :coffee_path ){ should eq( '/eastwood' ) }
    its( :coffee_args ){ should eq( '' ) }
  end

  describe 'match' do
    subject { context.routes[ :match ] }

    its( :name  ){ should eq( 'match' ) }
    its( :path  ){ should eq( '/foo.:format' ) }
    its( :parts ){ should eq( [ :format ] ) }

    its( :coffee_name ){ should eq( 'match_path' ) }
    its( :coffee_path ){ should eq( '/foo#{format}' ) }
    its( :coffee_args ){ should eq( "format='.json'" ) }
  end

  describe 'match with segment' do
    subject { context.routes[ :match_with_segment ] }

    its( :name  ){ should eq( 'match_with_segment' ) }
    its( :path  ){ should eq( '/foo/:id.:format' ) }
    its( :parts ){ should eq( [ :id, :format ] ) }

    its( :coffee_name ){ should eq( 'match_with_segment_path' ) }
    its( :coffee_path ){ should eq( '/foo/#{id}#{format}' ) }
    its( :coffee_args ){ should eq( "id, format='.json'" ) }
  end
end

describe 'hashes' do
  let( :context ){ Rails.application.assets.context_class.new nil, nil, nil }

  describe 'home' do
    subject { context.hashes[ :home ] }

    its( :name  ){ should eq( 'home' ) }
    its( :path  ){ should eq( '#/home' ) }
    its( :parts ){ should eq( [ ] ) }

    its( :coffee_name ){ should eq( 'home_hash' ) }
    its( :coffee_path ){ should eq( '#/home' ) }
    its( :coffee_args ){ should eq( '' ) }
  end

  describe 'user' do
    subject { context.hashes[ :user ] }

    its( :name  ){ should eq( 'user' ) }
    its( :path  ){ should eq( '#/users/:id' ) }
    its( :parts ){ should eq( [ :id ] ) }

    its( :coffee_name ){ should eq( 'user_hash' ) }
    its( :coffee_path ){ should eq( '#/users/#{id}' ) }
    its( :coffee_args ){ should eq( "id" ) }
  end

  describe 'post' do
    subject { context.hashes[ :post ] }

    its( :name  ){ should eq( 'post' ) }
    its( :path  ){ should eq( '#/users/:id/posts/:slug' ) }
    its( :parts ){ should eq( [ :id, :slug ] ) }

    its( :coffee_name ){ should eq( 'post_hash' ) }
    its( :coffee_path ){ should eq( '#/users/#{id}/posts/#{slug}' ) }
    its( :coffee_args ){ should eq( "id, slug" ) }
  end
end
