require 'spec_helper'

describe 'route formatting' do

  describe 'setting the default route format' do
    subject { ::Rails.application.assets.context_class.new nil, nil, nil }

    it { should respond_to( :route_format ) }

    context 'default format' do
      its( :route_format ){ should eq( '.json' ) }
    end

    context 'as a symbol' do
      before do
        Eastwood.default_route_format = :xml
      end

      its( :route_format ){ should eq( '.xml' ) }
    end

    context 'as a string' do
      before do
        Eastwood.default_route_format = 'html'
      end

      its( :route_format ){ should eq( '.html' ) }
    end

    context 'when empty string' do
      before do
        Eastwood.default_route_format = ''
      end

      its( :route_format ){ should eq( '' ) }
    end

    context 'when false' do
      before do
        Eastwood.default_route_format = false
      end

      its( :route_format ){ should eq( '' ) }
    end
  end

  describe 'including the format in routes' do
    let( :context ){ ::Rails.application.assets.context_class.new nil, nil, nil }
    subject { context.server_routes[ :match ] }

    context 'default format' do
      its( :coffee_args ){ should eq( "format='.json'" ) }
    end

    context 'custom format' do
      before do
        Eastwood.default_route_format = :xml
      end

      its( :coffee_args ){ should eq( "format='.xml'" ) }
    end

    context 'omit format' do
      before do
        Eastwood.default_route_format = false
      end

      its( :coffee_args ){ should eq( "format=''" ) }
    end
  end
end