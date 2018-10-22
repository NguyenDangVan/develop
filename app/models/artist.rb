class Artist < ApplicationRecord
  has_many :album
  validates :name, presence: true, length: {maximum: 30}
  validates :info, presence: true
end
