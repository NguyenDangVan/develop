class Category < ApplicationRecord
  has_many :album
  validates :name, presence: true, length: {maximum: 50}
end
