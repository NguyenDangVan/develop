class Song < ApplicationRecord
  belongs_to :album
  has_many :playlist, through: :playlist_song
  has_many :playlist_song
  has_many :lyrics, dependent: :destroy
  accepts_nested_attributes_for :lyrics, allow_destroy: true,
    reject_if: :all_blank
  has_many :favorites_from_user, class_name: Favorite.name, dependent: :destroy
  has_many :users_favorited, through: :favorites_from_user, source: :user
  has_many :comments, as: :commentable
  validates :name, presence: true, length: {maximum: Settings.user.max_name_size}
  validates :album_id, presence: true
  mount_uploader :audio, AudioUploader

  scope :search_song, -> (name_song) {where("name LIKE ?", "%#{name_song}%")}
end
