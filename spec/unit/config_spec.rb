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

  describe '#hash' do
    it { should respond_to( :hash ) }

    it 'should add a new hash' do
      Eastwood.hash :foo, '#/bar'

      Eastwood.hashes.should have_key( :foo )
      Eastwood.hashes[ :foo ].should eq( '#/bar' )
    end
  end
end
