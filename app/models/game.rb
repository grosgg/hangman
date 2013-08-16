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

  def next_round!
    if self.currentRound < self.totalRounds
      self.currentRound += 1
      true
    else
      false
    end
  end
end
