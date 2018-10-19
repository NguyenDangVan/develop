class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.string :name
      t.references :album, foreign_key: true
      t.text :lyric

      t.timestamps
    end
  end
end
