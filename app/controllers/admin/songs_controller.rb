class Admin::SongsController < Admin::BaseController

  def index
    @lyrics = Lyric.all
    if params[:search]
      @songs = Song.search_user_name(params[:search]).page(params[:page]).per 10
    else
      @songs = Song.page(params[:page]).per 10
    end
  end
end
