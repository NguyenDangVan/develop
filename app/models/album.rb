class Album < ApplicationRecord
  belongs_to :category
  belongs_to :artist
  has_many :songs
  validates :title, :category_id, :artist_id, :description, presence: true
  validates :title, length: {maximum: 50}

  scope :ordered_by_create_at, -> {order created_at: :desc}
  scope :search_title, ->(t){where "title LIKE ?", "%#{t}%"}
end
