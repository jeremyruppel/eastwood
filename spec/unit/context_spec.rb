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
    its( :env ) { should eq( Rails.env ) }
  end

  describe '#routes' do
    it { should respond_to( :routes ) }
    its( :routes ) { should have( 2 ).items }
    
    # describe 'a route defined with `match`' do
    #   subject { subject.routes[ :foo ] }
    #
    # end
  end

  describe '#hashes' do
    it { should respond_to( :hashes ) }
  end

end
