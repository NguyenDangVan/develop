class AlbumsController < ApplicationController
  #before_action :logged_in_user, only: %i(create destroy)
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
    @albums = Album.page(params[:page]).per 3
  end

  def destroy
    @album.destroy
    flash[:success] = "Album deleted"
    redirect_to request.referrer || root_url
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
