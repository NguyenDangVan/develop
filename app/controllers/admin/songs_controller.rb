class Admin::SongsController < Admin::BaseController

  def index
    @lyrics = Lyric.all
    @q = Song.ransack(params[:q])
    @songs = @q.result.includes(:album).page(params[:page]).per 10
  end
end
