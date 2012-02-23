require 'spec_helper'

describe Eastwood do

  context '#configure' do

    it { should respond_to( :configure ) }

    it 'should yield itself to the configure block' do
      Eastwood.configure do |config|
        config.should eq( Eastwood )
      end
    end
  end
end
