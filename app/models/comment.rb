class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :song
  default_scope -> { order(created_at: :desc) }
  has_many  :user_liked, through: :like_cmts, source: :user
  validates :user_id, presence: true
  validates :body, presence: true
end
