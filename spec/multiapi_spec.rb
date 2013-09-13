require 'spec_helper'

describe Multiapi do

  it "should not works" do
    lambda do
      Multiapi.works!
    end.should raise_error
  end

end
