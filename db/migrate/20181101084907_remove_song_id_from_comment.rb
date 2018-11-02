class RemoveSongIdFromComment < ActiveRecord::Migration[5.2]
  def change
    remove_column :comments, :song_id, :integer
  end
end
