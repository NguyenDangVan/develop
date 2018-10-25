class Song < ApplicationRecord
  belongs_to :album
  has_many :playlist_songs
  has_many :favorites
end
