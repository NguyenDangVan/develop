class Song < ApplicationRecord
  belongs_to :album
  has_many :playlist_song
  has_many :favorite
  validates :name, presence: true
  mount_uploader :audio, AudioUploader

  scope :search_song, -> (name_song) {where("name LIKE ?", "%#{name_song}%")}
end
