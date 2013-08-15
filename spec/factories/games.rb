require 'faker'

FactoryGirl.define do
  factory :game do
    session "5eb7db7151760f5aa6ec9120dfa059c4"
    totalRounds 10
    currentRound 3
    usedLetters "aesmti"
    wrongLetters "mi"
    word
    category
  end
end

