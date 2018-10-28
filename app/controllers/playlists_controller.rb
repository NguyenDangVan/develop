class PlaylistsController < ApplicationController
  before_action :logged_in_user, only: [:create, :show, :new]
  def show
    @playlist = current_user.playlists.find_by id: params[:id]
    return if @playlist
    flash[:danger] = "Not found this playlist"
    redirect_to not_found_path
    return if @playlist.nil?
    @playlistsongs = @playlist.playlist_songs.page params[:id]
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

  private
    def playlist_params
      params.require(:playlist).permit(:user_id, :title)
    end

    def logged_in_user
      return if logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
end
