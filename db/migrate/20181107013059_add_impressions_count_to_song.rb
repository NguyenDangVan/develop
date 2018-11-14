class AddImpressionsCountToSong < ActiveRecord::Migration[5.2]
  def change
    add_column :songs, :impressions_count, :int, default: 0
  end
end
