class CommentsController < ApplicationController
  before_action :find_cmt, only: %i(destroy edit update)

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new comment_params
    if @comment.save
      respond_to do |format|
        format.js
      end
    else
      flash[:danger] = "Your comment was not successfully added"
      redirect_to song_path(@comment.commentable_id)
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.js
    end
  end

  def edit;  end

  def update
    if @comment.update_attributes comment_params
      respond_to do |format|
        format.js
      end
    else
      flash[:danger] = "Your comment was not editted"
      redirect_to song_path(@comment.song_id)
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:body, :user_id, :commentable_id, :commentable_type)
    end

    def find_cmt
      @comment = Comment.find_by id: params[:id]
    end
end
