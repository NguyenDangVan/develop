class Admin::ArtistsController < Admin::BaseController

  def index
    @q = Artist.ransack(params[:q])
    @artists = @q.result(distinct: true).includes(:albums).page(params[:page]).per 5
  end
end
