class PlaylistSong < ApplicationRecord
  belongs_to :playlist
  belongs_to :song
  default_scope -> {order created_at: :desc}
  validates :playlist_id, presence: true
  validates :song_id, presence: true
end
