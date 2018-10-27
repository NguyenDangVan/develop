class Category < ApplicationRecord
  has_many :albums, dependent: :destroy
  has_many :songs, through: :albums
  validates :name, presence: true, length: {maximum: 50}

  scope :search_category_name, -> (t){where("name LIKE ?", "%#{t}%")}
end
