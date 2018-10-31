class SongsController < ApplicationController
  before_action :logged_in_user, only: :create
  before_action :find_song, except: %i(create new index)
  before_action :admin_user, only: %i(edit update destroy)
  before_action :all_categories

  def new
    @song = Song.new
  end

  def create
    @song = Song.new song_params
    if @song.save
      redirect_to admin_songs_path
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
        @songs = Song.page(params[:page]).per 5
      end
    end
  end

  def edit; end

  def update
    if @song.update_attributes song_params
      flash[:success] = "Updated song"
      redirect_to admin_songs_path
    else
      render :edit
    end
  end

  def show
    @playlist_song = PlaylistSong.new
    return if @song
    flash[:danger] = "Not found this song"
    redirect_to not_found_path
  end

  def download
    file_path = @song.audio
    if @song.audio?
      send_file @song.audio.path, :x_send_file => true
    else
      redirect_to @song
    end
  end

  def destroy
    if @song.destroy
      flash[:success] = "deleted song"
      redirect_to admin_songs_path
    else
      flash[:danger] = "There was an error with delete song"
      redirect_to admin_songs_path
    end
  end

  private

    def find_song
      @song = Song.find_by id: params[:id]

      return if @song
      flash[:danger] = "Not found song"
      redirect_to root_url
    end

    def song_params
      params.require(:song).permit(:audio, :name, :lyric, :album_id)
    end
end
