class CreatePlaylists < ActiveRecord::Migration[5.2]
  def change
    create_table :playlists do |t|
      t.string :title
      t.references :user, foreign_key: true
      t.integer :view_number
      t.text :description

      t.timestamps
    end
    add_index :playlists, [:user_id, :created_at]
  end
end
