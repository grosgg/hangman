class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :session
      t.integer :totalRounds
      t.integer :currentRound
      t.string :usedLetters
      t.string :wrongLetters
      t.references :word, index: true
      t.references :category, index: true
      t.references :language, index: true

      t.timestamps
    end
  end
end
