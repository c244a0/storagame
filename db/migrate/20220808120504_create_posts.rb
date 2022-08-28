class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :youtube_url, null: false
      t.text   :content, null: false
      t.references :user, null: false, foreign_key: true
      t.references :game, null: false, foreign_key: true
      t.references :grade, null: false, foreign_key: true
      t.references
      t.timestamps
    end
  end
end
