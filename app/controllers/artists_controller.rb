class ArtistsController < ApplicationController
  before_action :find_artist, except: %i(create new index)
  before_action :logged_in_user, except: %i(show index)
  before_action :admin_user, only: %i(new create destroy)

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new artist_params
    if @artist.save
      flash[:success] = "Add new artist."
      redirect_to admin_artists_path
    else
      render :new
    end
  end

  def edit; end

  def show
    @albums = @artist.albums.page(params[:page]).per 3
  end

  def update
    if @artist.update_attributes artist_params
      flash[:success] = "Updated artist"
      redirect_to admin_artists_path
    else
      render :edit
    end
  end

  def destroy
    @artist.destroy
    flash[:success] = "deleted artist"
    redirect_to admin_artists_path
  end

  def index
    if params[:search]
      @artists = Artist.search_artist(params[:search]).page(params[:page]).per 5
    else
      @artists = Artist.page(params[:page]).per 5
    end
  end

  private

    def artist_params
      params.require(:artist).permit :name, :info
    end

    def find_artist
      @artist = Artist.find_by id: params[:id]
      return if @artist
      flash[:danger] = "Not found artist"
      redirect_to root_url
    end
end
