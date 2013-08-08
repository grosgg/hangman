require 'spec_helper'

describe Category do
  it "has a name"

  it "has a language" do
    Category.new.should respond_to :language
  end

end
