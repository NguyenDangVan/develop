class LyricsController < ApplicationController
  def new
    @song = Song.find_by id: params[:song_id]
    @lyric = Lyric.new
  end

  def create
    @lyric = Lyric.new lyric_params
    if @lyric.save
      flash.now[:success] = "Playlist is created"
      redirect_to admin_songs_path
    else
      flash.now[:danger] = "Playlist is not created"
      render :new
    end
  end

  private

    def lyric_params
      params.require(:lyric).permit(:content, :song_id)
    end
end
