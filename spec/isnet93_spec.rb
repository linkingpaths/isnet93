require 'spec_helper'

describe Isnet93 do
  it 'should have a version number' do
    Isnet93::VERSION.should_not be_nil
  end

  it "should convert to WSG84" do
    Isnet93.to_wgs84(387994, 477755).should == [64.78173836, -21.35577008]
  end

end