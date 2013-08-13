require 'spec_helper'

describe Language do
  it "is invalid without a name" do
    FactoryGirl.build(:language, name: nil).should_not be_valid
  end
end
