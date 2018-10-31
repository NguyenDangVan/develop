class AddCommentToLikeCmt < ActiveRecord::Migration[5.2]
  def change
    add_reference :like_cmts, :comment, foreign_key: true
  end
end
