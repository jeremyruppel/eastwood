require 'spec_helper'

describe 'eastwood.js' do

  it 'should serve the asset through the asset pipeline' do
    get '/assets/eastwood.js'

    response.status.should eq( 200 )
    response.content_type.should eq( 'text/javascript' )

    puts response.body
  end
end
