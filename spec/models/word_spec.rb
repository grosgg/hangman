require 'spec_helper'

describe Word do
  it "has a name" do
    Word.new.should respond_to :name
  end

  it "has a category" do
    Word.new.should respond_to :category
  end

  it "has a language" do
    Word.new.should respond_to :language
  end

  it "checks if a letter is contained in the name"
end
