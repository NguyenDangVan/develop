class Admin::SongsController < Admin::BaseController

  def index
    if params[:search]
      @songs = Song.search_user_name(params[:search]).page(params[:page]).per 10
    else
      @songs = Song.page(params[:page]).per 10
    end
  end

  def destroy
    @song = Song.find_by id: params[:id]
    if @song.lyric
      @song.lyric = nil
    else
      flash[:danger] = "Lyric is nill"
    end
  end

  def add
    @song = Song.find_by id: params[:id]
    if @song.lyric.nil
      redirect_to new_song_path
    end
  end
end
