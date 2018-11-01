class Admin::LyricsController < Admin::BaseController

  def destroy
    @lyric_song = Lyric.find_by id: params[:id], song_id: params[:song_id]
    if @lyric_song.destroy
      redirect_to admin_songs_path
    end
  end
end
