require 'spec_helper'

describe Game do
  it "has a valid factory" do
    FactoryGirl.create(:game).should be_valid
  end

  it "is invalid without a session attached" do
    FactoryGirl.build(:game, session: nil).should_not be_valid
  end

  it "is invalid without round total" do
    FactoryGirl.build(:game, totalRounds: nil).should_not be_valid
  end

  it "is invalid without a current round" do
    FactoryGirl.build(:game, currentRound: nil).should_not be_valid
  end

  it "has a current word" do
    FactoryGirl.create(:game).should respond_to :word
  end

  it "has a category" do
    FactoryGirl.create(:game).should respond_to :category
  end

  it "checks how many wrong letters were used" do
    game = FactoryGirl.create(:game, wrongLetters: "kzwx")
    expect(game.count_mistakes).to eq(4)
  end

  it "checks if a letter was already used" do
    game = FactoryGirl.create(:game, usedLetters: "aeiou")
    expect(game.was_letter_used?("a")).to be_true
    expect(game.was_letter_used?("t")).to be_false
  end

  it "checks if all correct letters were found"

  it "adds a letter to the list of used letters" do
    game = FactoryGirl.create(:game, usedLetters: "aeiou")
    game.add_to_used_letters!("t");
    expect(game.usedLetters).to eq("aeiout");
    game.add_to_used_letters!("e");
    expect(game.usedLetters).to eq("aeiout");
  end

  it "adds a letter to the list of wrong letters" do
    game = FactoryGirl.create(:game, wrongLetters: "kzwx", usedLetters: "akxeiwozu")
    game.add_to_wrong_letters!("q");
    expect(game.wrongLetters).to eq("kzwxq");
    game.add_to_wrong_letters!("w");
    expect(game.wrongLetters).to eq("kzwxq");
  end
end
