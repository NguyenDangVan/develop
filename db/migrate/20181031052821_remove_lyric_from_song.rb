class RemoveLyricFromSong < ActiveRecord::Migration[5.2]
  def change
    remove_column :songs, :lyric, :text
  end
end
