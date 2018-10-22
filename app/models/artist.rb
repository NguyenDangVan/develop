class Artist < ApplicationRecord
  has_many :albums, dependent: :destroy
  validates :name, presence: true, length: {maximum: 30}
  validates :info, presence: true
end
