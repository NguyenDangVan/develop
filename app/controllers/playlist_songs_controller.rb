class PlaylistSongsController < ApplicationController
  def show;  end

  def create
    @playlist_song = PlaylistSong.new param_playlist_song
    @song = Song.find_by id: param_playlist_song[:song_id]
    @playlist = Playlist.find_by id: param_playlist_song[:playlist_id]
    @playlist_song.save
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @playlist_song = PlaylistSong.find_by playlist_id: params[:playlist_id],
      song_id: params[:song_id]
    if @playlist_song.destroy
      flash[:success] = "Deleted successful"
    else
      flash[:danger] = "Deleted from this playlist"
    end
    redirect_to user_playlist_path(current_user, params[:playlist_id])
  end

  private

  def param_playlist_song
    params.require(:playlist_song).permit(:song_id, :playlist_id)
  end
end
