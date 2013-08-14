class Word < ActiveRecord::Base
  belongs_to :category

  validates :name, presence: true

  def includes_letter? (letter)
      self.name.include? letter
  end
end
