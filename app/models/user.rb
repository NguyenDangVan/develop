class User < ApplicationRecord
  has_many :favorite
  has_many :playlist
  validates :name, :email, :age, presence: true
  validates :name, length: {maximum: Settings.models.maximum_name}
  validates :age, numericality: true, length: {maximum: Settings.models.maximum_age}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validate :email,length: {maximum: Settings.models.maximum_email} uniqueness: {case_sensitive: false}, format: {with: VALID_EMAIL_REGEX}
end
