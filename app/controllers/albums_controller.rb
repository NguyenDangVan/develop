class AlbumsController < ApplicationController
  before_action :logged_in_user, except: %i(show index song_album)
  before_action :admin_user, except: %i(show index song_album)
  before_action :correct_category, only: :destroy

  def new
    @album = Album.new
  end

  def create
    @album = Album.new album_params
    if @album.save
      flash[:success] = "Created new album"
      redirect_to @album
    else
      render :new
    end
  end

  def show
    @album = Album.find_by id: params[:id]
  end

  def index
    @artists = Artist.all
    @category = Category.find_by id: params[:category_id]
    if @category
      #@albums = @category.albums.page(params[:page]).per 4
      @q = @category.albums.ransack(params[:q])
      @albums = @q.result.page(params[:page]).per 4
    else
      @q = Album.ransack(params[:q])
      @albums = @q.result.page(params[:page]).per 4
    end
  end

  def destroy
    @album.destroy
    flash[:success] = "Album deleted"
    redirect_to request.referrer || root_url
  end

  def song_album
    @album = Album.find_by id: params[:id]
    @songs = @album.songs.page(params[:page]). per 3
  end

  private

    def album_params
      params.require(:album).permit :title, :category_id, :artist_id, :description
    end

    def correct_category
      @album = Album.find_by id: params[:id]
      redirect_to root_url if @album.nil?
    end
end
