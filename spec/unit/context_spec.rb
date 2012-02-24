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

  describe 'match' do
    subject { context.routes[ :match ] }

    its( :name  ){ should eq( 'match' ) }
    its( :path  ){ should eq( '/foo.:format' ) }
    its( :parts ){ should eq( [ :format ] ) }

    its( :coffee_name ){ should eq( 'match_path' ) }
    its( :coffee_path ){ should eq( '/foo.#{format}' ) }
    its( :coffee_args ){ should eq( "format='json'" ) }
  end

  describe 'match with segment' do
    subject { context.routes[ :match_with_segment ] }

    its( :name  ){ should eq( 'match_with_segment' ) }
    its( :path  ){ should eq( '/foo/:id.:format' ) }
    its( :parts ){ should eq( [ :id, :format ] ) }

    its( :coffee_name ){ should eq( 'match_with_segment_path' ) }
    its( :coffee_path ){ should eq( '/foo/#{id}.#{format}' ) }
    its( :coffee_args ){ should eq( "id, format='json'" ) }
  end
end
