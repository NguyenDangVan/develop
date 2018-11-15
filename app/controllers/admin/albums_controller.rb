class Admin::AlbumsController < Admin::BaseController

  def index
    @q = Album.ransack(params[:q])
    @albums = @q.result(distinct: true).includes(:artist, :category).page(params[:page]).per 5
  end
end
