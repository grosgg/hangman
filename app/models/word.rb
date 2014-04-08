class Word
  include Mongoid::Document

  field :name, type: String

  belongs_to :category
  has_and_belongs_to_many :games

  validates :name, presence: true

  def includes_letter? (letter)
      self.name.include? letter
  end
end
