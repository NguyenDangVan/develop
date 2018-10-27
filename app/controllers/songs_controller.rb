class SongsController < ApplicationController
  before_action :logged_in_user, only: :create
  before_action :find_song, only: %i(show download destroy)

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
    if params[:search]
      @songs = Song.search_song(params[:search]).page(params[:page]).per 5
    else
      if @category
        @songs = @category.songs.page(params[:page]).per 5
      elsif @artist
        @songs = @artist.songs.page(params[:page]).per 5
      else
        #@q = Song.ransack(params[:q])
        @songs = Song.page(params[:page]).per 5
      end
    end
  end

  def show; end

  def download
    file_path = @song.audio
    if @song.audio?
      send_file "#{Rails.root}/public/#{file_path}", :x_sendfile => true
    else
      redirect_to @song
    end
  end

  def destroy
    if @song.destroy
      flash[:success] = "deleted song"
      redirect_to songs_path
    else
      redirect_to songs_path, flash[:danger] = "There was an error with delete song"
    end
  end

  private

    def find_song
      @song = Song.find_by id: params[:id]
      return if @song
      flash[:danger] = "Not found song"
      redirect_to songs_path
    end

    def song_params
      params.require(:song).permit(:audio, :name, :lyric, :album_id)
    end
end
