class CreateLyrics < ActiveRecord::Migration[5.2]
  def change
    create_table :lyrics do |t|
      t.string :content
      t.references :song, foreign_key: true

      t.timestamps
    end
  end
end
