class SongsController < ApplicationController
  before_action :logged_in_user, only: :create
  before_action :find_song, except: %i(create new index)
  before_action :admin_user, only: %i(edit update destroy)
  before_action :all_categories
  impressionist actions: [:show]

  def new
    @song = Song.new
    @song.lyrics.new
  end

  def create
    @song = Song.new song_params
    if @song.save
      redirect_to admin_songs_path
    else
      @song.lyrics || @song.lyrics.new
      flash.now[:danger] = "upload not successfull"
      render :new
    end
  end

  def index
    @artist = Artist.find_by id: params[:artist_id]
    @category = Category.find_by id: params[:category_id]
    if params[:search]
      @songs = Song.search_song(params[:search]).page(params[:page]).per 4
    else
      if @category
        @songs = @category.songs.page(params[:page]).per 4
      elsif @artist
        @songs = @artist.songs.page(params[:page]).per 4
      else
        @songs = Song.page(params[:page]).per 4
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
    @lyrics = Lyric.all
    @comment = Comment.new
    # @comment5 = @song.comments.first(5)
    # @comment6_to_last = @song.comments[5..-1]
    @comments = @song.comments.where(parent_id: nil)
    @songs = Song.all.rank_song
  end

  def download
    file_path = @song.audio
    if @song.audio?
      @song.count_download
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
      params.require(:song).permit :audio, :name, :album_id,
        lyrics_attributes: [:content]
    end
end
