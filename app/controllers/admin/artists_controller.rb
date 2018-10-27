class Admin::ArtistsController < Admin::BaseController

  def index
    if params[:search]
      @artists = Artist.search_artist_name(params[:search]).page(params[:page]).per 10
    else
      @artists = Artist.page(params[:page]).per 10
    end
  end
end
