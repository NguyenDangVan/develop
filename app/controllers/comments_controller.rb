class CommentsController < ApplicationController
  before_action :find_cmt, only: %i(destroy edit update)

  def new
    @comment = Comment.new(parent_id: params[:parent_id])
  end

  def create
    if params[:comment][:parent_id].to_i > 0
      parent = Comment.find_by_id(params[:comment].delete(:parent_id))
      @comment = parent.children.build(comment_params)
    else
      @comment = Comment.new comment_params
    end
    if @comment.save
      if @comment.commentable_type == "Song"
        @comment.create_activity key: "Commented on song
        <a href='/songs/#{@comment.commentable.id}'><b>#{@comment.commentable.name}</b></a> <br/>#{@comment.body[0..50]}", owner: current_user
        redirect_to song_path(@comment.commentable_id)
      end
      if @comment.commentable_type == "Playlist"
        @comment.create_activity key: "Commented on playlist
        <a href='/users/#{params[:comment][:user_comment_id]}/playlists/#{@comment.commentable_id}'><b>#{@comment.commentable.title}</b></a> <br /> #{@comment.body[0..50]}", owner: current_user
        redirect_to user_playlist_path(params[:comment][:user_comment_id], @comment.commentable_id)
      end
      flash[:success] = "Successfully"
    else
      flash[:danger] = "Unsuccessfully"
    end
  end

  def destroy
    if @comment.commentable_type == "Song"
      @comment.create_activity key: "Deleted comment on song
      <a href='/songs/#{@comment.commentable.id}'><b>#{@comment.commentable.name}</b></a> <br /> #{@comment.body[0..50]}", owner: current_user
    end

    if @comment.commentable_type == "Playlist"
      @comment.create_activity key: "Deleted comment on playlist
      <a href='/users/#{params[:user_id]}/playlists/#{@comment.commentable_id}'><b> <br />#{@comment.commentable.title}</b></a><br /> #{@comment.body[0..50]}", owner: current_user
    end

    @comment.destroy
    respond_to do |format|
      format.js
    end
  end

  def edit;  end

  def update
    if @comment.update_attributes comment_params
      if @comment.commentable_type == "Song"
        @comment.create_activity key: "Editted on song
        <a href='/songs/#{@comment.commentable.id}'><b>#{@comment.commentable.name}</b></a>", owner: current_user
      end
      if @comment.commentable_type == "Playlist"
        @comment.create_activity key: "Editted on playlist
        <a href='/users/#{params[:comment][:user_comment_id]}/playlists/#{@comment.commentable_id}'><b>#{@comment.commentable.title}</b></a>", owner: current_user
      end
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
