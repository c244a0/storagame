class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :game_title, null: false, unique: true
      t.timestamps
    end
  end
end
