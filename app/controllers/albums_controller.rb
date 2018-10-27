class AlbumsController < ApplicationController
  before_action :find_album, except: %i(create new index)
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
      redirect_to admin_albums_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @album.update_attributes album_params
      flash[:success] = "Updated album"
      redirect_to admin_albums_path
    else
      render :edit
    end
  end

  def show; end

  def index
    @artists = Artist.all
    @category = Category.find_by id: params[:category_id]
    if @category
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

    def find_album
      @album = Album.find_by id: params[:id]
      return if @album
      flash[:danger] = "Not found album"
      redirect_to root_url
    end
end
