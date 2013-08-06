class Word < ActiveRecord::Base
  belongs_to :category
  belongs_to :language

  validates :name, presence: true
end
