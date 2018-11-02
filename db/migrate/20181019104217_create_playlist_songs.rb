class CreatePlaylistSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :playlist_songs do |t|
      t.references :playlist, foreign_key: true
      t.references :song, foreign_key: true

      t.timestamps
    end
    add_index :playlist_songs, [:playlist_id, :create_at]
    add_index :playlist_songs, [:playlist_id, :song_id], unique: true
  end
end
