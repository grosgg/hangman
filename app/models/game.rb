class Game < ActiveRecord::Base
  belongs_to :category
  belongs_to :word

  validates :session, presence: true
  validates :totalRounds, presence: true
  validates :currentRound, presence: true

  def count_mistakes
    self.wrongLetters.length
  end

  def was_letter_used?(letter)
    self.usedLetters.include? letter
  end
end
