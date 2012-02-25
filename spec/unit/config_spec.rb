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

    describe 'adding a hash' do
      before do
        Eastwood.hash :foo, '#/bar'
      end

      subject { Eastwood.hashes }

      it { should include( :foo => '#/bar' ) }
    end
  end
end
