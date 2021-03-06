module CommentsHelper
  def comments_tree_for(comments)
    comments.map do |comment|
      nested_comments = Comment.where(parent_id: comment.id)
      render(comment) +
      (nested_comments.size > 0 ? content_tag(:div, comments_tree_for(nested_comments), class: "replies", style: "display: none") : nil)
    end.join.html_safe
  end
end
