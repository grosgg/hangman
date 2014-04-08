require 'spec_helper'

describe Category do
  it "is invalid without a name" do
    FactoryGirl.build(:category, name: nil).should_not be_valid
  end

end
