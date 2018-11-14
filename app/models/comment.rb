class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  default_scope -> {order created_at: :desc}
  validates :user_id, presence: true
  validates :body, presence: true
  acts_as_tree order: 'created_at DESC'
end
