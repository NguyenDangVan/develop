class Admin::AlbumsController < Admin::BaseController

  def index
    if params[:search]
      @albums = Album.search_title(params[:search]).page(params[:page]).per 10
    else
      @albums = Album.page(params[:page]).per 10
    end
  end
end
