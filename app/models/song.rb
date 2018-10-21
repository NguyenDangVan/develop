class Song < ApplicationRecord
  belongs_to :album
  has_many :playlist_song
  has_many :favorite
end
