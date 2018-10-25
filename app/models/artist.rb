class Artist < ApplicationRecord
  has_many :albums, dependent: :destroy
  has_many :songs, through: :albums
  validates :name, presence: true, length: {maximum: 30}
  validates :info, presence: true
end
