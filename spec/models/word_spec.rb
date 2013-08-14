require 'spec_helper'

describe Word do
  it "has a valid factory" do
    FactoryGirl.create(:word).should be_valid
  end

  it "is invalid without a name" do
    FactoryGirl.build(:word, name: nil).should_not be_valid
  end

  it "has a category" do
    Word.new.should respond_to :category
  end

  it "checks if a letter is contained in the name" do
    argentina = FactoryGirl.create(:word, name: "argentina")
    expect(argentina.includes_letter?("a")).to be_true
    expect(argentina.includes_letter?("o")).to be_false
  end
end
