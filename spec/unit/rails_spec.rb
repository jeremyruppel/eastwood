require 'spec_helper'

describe Eastwood do

  describe '#application_name' do
    it { should respond_to( :application_name ) }
    its( :application_name ){ should eq( ::Rails.application.class.name.split( '::' ).first ) }
  end

  describe '#env' do
    it { should respond_to( :env ) }
    it { should delegate( :env ).to( ::Rails, :env ) }
  end

  describe '#named_routes' do
    it { should respond_to( :named_routes ) }
    it { should delegate( :named_routes ).to( ::Rails.application.routes.named_routes, :routes ) }
  end
end
