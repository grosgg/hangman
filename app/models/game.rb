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

  def add_to_used_letters!(letter)
    if !self.was_letter_used?(letter)
      self.usedLetters << letter
    end
    self.usedLetters
  end

  def add_to_wrong_letters!(letter)
    if !self.was_letter_used?(letter)
      self.wrongLetters << letter
    end
    self.wrongLetters
  end
end
