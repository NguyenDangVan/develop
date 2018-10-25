class RemoveAlbumTitleFromSongs < ActiveRecord::Migration[5.2]
  def change
    remove_column :songs, :album_title, :string
  end
end
