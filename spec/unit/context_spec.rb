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

  describe 'foo' do
    subject { context.routes[ :foo ] }

    its( :name  ){ should eq( 'foo' ) }
    its( :verb  ){ should eq( 'GET' ) }
    its( :path  ){ should eq( '/foo.:format' ) }
    its( :parts ){ should eq( [ :format ] ) }
  end
end
