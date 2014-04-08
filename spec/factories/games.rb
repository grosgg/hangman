require 'faker'

FactoryGirl.define do
  factory :game do
    session "5eb7db7151760f5aa6ec9120dfa059c4"
    currentRound 0
    usedLetters "aesmti".chars
    wrongLetters "mi".chars
    words {[FactoryGirl.create(:word), FactoryGirl.create(:word)]}
    category
  end
end

