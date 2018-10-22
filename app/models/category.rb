class Category < ApplicationRecord
  has_many :albums, dependent: :destroy
  validates :name, presence: true, length: {maximum: 50}
end
