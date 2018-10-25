class SongsController < ApplicationController
  before_action :logged_in_user, only: [:create, :download]
  def new
    @song = Song.new
  end

  def create
    @song = Song.new song_params
    if @song.save
      flash[:success] = "upload success"
      redirect_to @song
    else
      flash.now[:danger] = "upload not success"
      render :new
    end
  end

  def index
    @q = Songs.ransack(params[:q])
    @songs = @q.result.page(params[:page]).per 10
  end

  def show
    @song = Song.find params[:id]
  end

  def download
   @song = Song.find(params[:id])
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

    def logged_in_user
      return if logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
end
