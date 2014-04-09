require 'spec_helper'

describe Game do
  it "has a valid factory" do
    FactoryGirl.create(:game).should be_valid
  end

  it "is invalid without a current round" do
    FactoryGirl.build(:game, currentRound: nil).should_not be_valid
  end

  it "has timestamps" do
    FactoryGirl.create(:game).should respond_to :created_at
    FactoryGirl.create(:game).should respond_to :updated_at
  end

  it "has a current word" do
    FactoryGirl.create(:game).should respond_to :words
  end

  it "has a category" do
    FactoryGirl.create(:game).should respond_to :category
  end

  it "checks how many wrong letters were used" do
    game = FactoryGirl.create(:game, wrongLetters: "kzwx".chars)
    expect(game.count_mistakes).to eq(4)
  end

  it "checks if a letter was already used" do
    game = FactoryGirl.create(:game, usedLetters: "aeiou".chars)
    expect(game.was_letter_used?("a")).to be_true
    expect(game.was_letter_used?("t")).to be_false
  end

  it "adds a letter to the list of used letters" do
    game = FactoryGirl.create(:game, usedLetters: "aeiou".chars)
    game.add_to_used_letters!("t")
    expect(game.usedLetters).to eq("aeiout".chars)
    game.add_to_used_letters!("e")
    expect(game.usedLetters).to eq("aeiout".chars)
  end

  it "adds a letter to the list of wrong letters" do
    game = FactoryGirl.create(:game, wrongLetters: "kzwx".chars, usedLetters: "akxeiwozu".chars)
    game.add_to_wrong_letters!("q")
    expect(game.wrongLetters).to eq("kzwxq".chars)
    game.add_to_wrong_letters!("w")
    expect(game.wrongLetters).to eq("kzwxq".chars)
  end

  it "switches the to next round" do
    game = FactoryGirl.create(:game, currentRound: 0, usedLetters: "aeiou".chars, wrongLetters: "mp".chars)
    expect(game.next_round!).to be_true
    expect(game.currentRound).to eq(1)
    expect(game.usedLetters).to be_empty
    expect(game.wrongLetters).to be_empty
    expect(game.next_round!).to be_false
    expect(game.currentRound).to eq(1)
  end

  it "checks if all correct letters were found" do
    france = FactoryGirl.create(:word, name: "france")
    completedGame = FactoryGirl.create(:game, usedLetters: "eartcmlnif".chars, words: [france])
    uncompletedGame = FactoryGirl.create(:game, usedLetters: "eartok".chars, words: [france])

    expect(completedGame.found_all_letters?).to be_true
    expect(uncompletedGame.found_all_letters?).to be_false
  end
end
