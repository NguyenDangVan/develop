class AddSongToComments < ActiveRecord::Migration[5.2]
  def change
    add_reference :comments, :song, foreign_key: true
  end
end
