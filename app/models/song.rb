class Song < ApplicationRecord
  belongs_to :album
  has_many :playlist, through: :playlist_song
  has_many :playlist_song
  has_many :lyrics, dependent: :destroy
  accepts_nested_attributes_for :lyrics
  has_many :favorites_from_user, class_name: Favorite.name, dependent: :destroy
  has_many :users_favorited, through: :favorites_from_user, source: :user
  validates :name, presence: true, length: {maximum: 30}
  validates :album_id, presence: true
  mount_uploader :audio, AudioUploader

  scope :search_song, -> (name_song) {where("name LIKE ?", "%#{name_song}%")}
end
