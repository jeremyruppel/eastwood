require 'spec_helper'

describe Eastwood do

  describe '#application_name' do
    it { should respond_to( :application_name ) }

    its( :application_name ){ should eq( ::Rails.application.class.name.split( '::' ).first ) }
  end
end
