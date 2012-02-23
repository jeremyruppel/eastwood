require 'spec_helper'

describe 'the Sprockets context class' do

  subject { Rails.application.assets.context_class.new nil, nil, nil }

  it 'should have Eastwood::Context mixed in' do
    subject.class.ancestors.should include( Eastwood::Context )
  end
end

describe Eastwood::Context do

end
