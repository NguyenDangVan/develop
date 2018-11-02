class Playlist < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  has_many :playlist_songs, dependent: :destroy
  has_many :songs, through: :playlist_songs
  has_many :comments, as: :commentable
  validates :title, presence: true
  validates :user_id, presence: true
end
