class PlaylistSongsController < ApplicationController
  def show

  end

  def create
    @playlist_song = PlaylistSong.new param_playlist_song
    if @playlist_song.save
      flash[:success] = "add successful"
    else
      flash[:danger] = "add unsuccesful"
    end
    redirect_to song_path(@playlist_song.song_id)
  end

  private
    def param_playlist_song
      params.require(:playlist_song).permit(:song_id, :playlist_id)
    end
end
