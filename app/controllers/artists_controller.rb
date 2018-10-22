class ArtistsController < ApplicationController
  before_action :find_artist, except: %i(create new)

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new artist_params
    if @artist.save
      flash[:success] = "add new artist."
      redirect_to @artist
    else
      render :new
    end
  end

  def edit; end

  def show; end

  def update
    if @artist.update_attributes artist_params
      flash[:success] = "Updated artist"
      redirect_to @artist
    else
      render :edit
    end
  end

  def index
    @artists = Artist.page(params[:page]).per 10
  end

  private

    def artist_params
      params.require(:artist).permit :name, :info
    end

    def find_artist
      @artist = Artist.find_by id: params[:id]
      return if @artist
      flash.now[:danger] = "Not found artist"
      redirect_to root_url
    end
end
