class SongsController < ApplicationController
  before_action :logged_in_user, only: :create
  def new
    @song = Song.new
  end

  def create
    @song = Song.new song_params
    if @song.save
      flash[:success] = "upload successfull"
      redirect_to @song
    else
      flash.now[:danger] = "upload not successfull"
      render :new
    end
  end

  def index
    @artist = Artist.find_by id: params[:artist_id]
    @category = Category.find_by id: params[:category_id]
    if @category
      @q = @category.songs.ransack(params[:q])
      @songs = @q.result.page(params[:page]).per 5
    elsif @artist
      @q = @artist.songs.ransack(params[:q])
      @songs = @q.result.page(params[:page]).per 5
    else
      @q = Song.ransack(params[:q])
      @songs = @q.result.page(params[:page]).per 5
    end
  end

  def show
    @song = Song.find_by id: params[:id]
  end

  def download
   @song = Song.find_by id: params[:id]
    file_path = @song.audio
    if @song.audio?
      send_file "#{Rails.root}/public/#{file_path}", :x_sendfile => true
    else
       redirect_to @song
    end
  end

  private

    def song_params
      params.require(:song).permit(:audio, :name, :lyric, :album_id)
    end
end
