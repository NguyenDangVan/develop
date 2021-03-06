class Album < ApplicationRecord
  belongs_to :category
  belongs_to :artist
  has_many :songs
  validates :title, :category_id, :artist_id, :description, presence: true
  validates :title, length: {maximum: Settings.album.maxsize_title}
  is_impressionable
  scope :ordered_by_create_at, -> {order created_at: :desc}
  scope :search_title, -> (t) {where "title LIKE ?", "%#{t}%"}
  scope :rank_album, -> {order("(SELECT COUNT(DISTINCT impressions.id) FROM impressions WHERE impressions.impressionable_id = albums.id AND impressions.impressionable_type = 'Album') DESC LIMIT 5")}
end
