class PlaylistsController < ApplicationController
  before_action :logged_in_user, only: [:create, :show, :new, :destroy]

  def show
    @user = User.find_by id: params[:user_id]
    @playlist = @user.playlists.find_by id: params[:id]
    @comment5 = @playlist.comments.where(parent_id: nil).first(5)
    @comment6_to_last = @playlist.comments[5..-1]
    @songs = Song.all.rank_song
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
      @playlist.create_activity key: "Created a new playlist <a href='/users/#{current_user.id}/playlists/#{@playlist.id}'><b>#{@playlist.title}</b></a> successfully", owner: current_user
      redirect_to current_user
    else
      flash[:danger] = "Playlist is not created"
      render :new
    end
  end

  def destroy
    @del_playlist = current_user.playlists.find_by(id: params[:id])
    @del_playlist.create_activity key: "Deleted playlist <b>#{@del_playlist.title}</b> successfully", owner: current_user
    @del_playlist.destroy

    flash[:success] = "Playlist deleted"
    redirect_to current_user
  end

  private
    def playlist_params
      params.require(:playlist).permit(:user_id, :title)
    end

    def to_key
      id ? id : nil
    end
end
