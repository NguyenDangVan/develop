class PlaylistsController < ApplicationController
  before_action :logged_in_user, only: [:create, :show, :new, :destroy]

  def show
    @user = User.find_by id: params[:user_id]
    @playlist = @user.playlists.find_by id: params[:id]
    @comment5 = @playlist.comments.first(5)
    @comment6_to_last = @playlist.comments[5..-1]
    if @user.playlists.exists?(id: params[:id])
      @comment = Comment.new

    else
      flash[:danger] = "Not found this playlist"
      redirect_to not_found_path
    end
  end

  def new
    @user = User.find_by id: params[:user_id]
    @playlist = Playlist.new
  end

  def create
    @playlist = Playlist.new playlist_params
    if @playlist.save
      flash[:success] = "Playlist is created"
      redirect_to current_user
    else
      flash[:danger] = "Playlist is not created"
      render :new
    end
  end

  def destroy
    current_user.playlists.find_by(id: params[:id]).destroy
    flash[:success] = "Playlist deleted"
    redirect_to current_user
  end

  private
    def playlist_params
      params.require(:playlist).permit(:user_id, :title)
    end

    def logged_in_user
      return if logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end

    def to_key
id ? id : nil
end
end
