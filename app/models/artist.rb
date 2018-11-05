class Artist < ApplicationRecord
  has_many :albums, dependent: :destroy
  has_many :songs, through: :albums
  validates :name, presence: true, length: {maximum: Settings.user.max_name_size}
  validates :info, presence: true

  scope :search_artist_name, -> (name_artist) {where("name LIKE ?", "%#{name_artist}%")}
end
