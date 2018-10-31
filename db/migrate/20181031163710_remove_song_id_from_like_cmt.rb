class RemoveSongIdFromLikeCmt < ActiveRecord::Migration[5.2]
  def change
    remove_column :like_cmts, :song_id, :integer
  end
end
