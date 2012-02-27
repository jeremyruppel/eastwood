require 'spec_helper'

describe Eastwood do

  describe '#application_name' do
    it { should respond_to( :application_name ) }
    its( :application_name ){ should eq( ::Rails.application.class.name.split( '::' ).first ) }
  end

  describe '#env' do
    it { should respond_to( :env ) }

    it 'should delegate to the rails env' do
      ::Rails.should_receive :env
      Eastwood.env
    end
  end

  describe '#named_routes' do
    it { should respond_to( :named_routes ) }

    it 'should delegate to the rails named routes' do
      ::Rails.application.routes.named_routes.should_receive :routes
      Eastwood.named_routes
    end
  end
end
