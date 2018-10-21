class User < ApplicationRecord
  before_save {email.downcase!}
  has_many :favorite
  has_many :playlist
  validates :name, :email, :age, :password, presence: true
  validates :name, length: {maximum: 30}
  validates :age, numericality: true, length: {maximum: 3}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, length: {maximum: 255},uniqueness: {case_sensitive: false}, format: {with: VALID_EMAIL_REGEX}
  has_secure_password
  validates :password, length: {minimum: 6}
end
