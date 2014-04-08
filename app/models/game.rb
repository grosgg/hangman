class Game
  include Mongoid::Document

  field :session, type: String
  field :currentRound, type: Integer, default: 0
  field :usedLetters, type: Array
  field :wrongLetters, type: Array

  belongs_to :category
  has_and_belongs_to_many :words

  validates :session, presence: true
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

  def found_all_letters?
    self.words[currentRound].name.each_char do |c|
        if !was_letter_used?(c)
          return false
        end
    end
    return true
  end

  def next_round!
    if self.currentRound < self.words.count-1
      self.currentRound += 1
      true
    else
      false
    end
  end
end
