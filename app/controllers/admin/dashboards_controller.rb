class Admin::DashboardsController < Admin::BaseController
  def index
    q = params[:q]
    @songs = Song.ransack(name_cont: q).result.page(params[:page]).per 10
    @albums = Album.ransack(title_cont: q).result
    @users = User.ransack(name_cont: q).result.page(params[:page]).per 10
    @artists = Artist.ransack(name_cont: q).result.page(params[:page]).per 10
  end
end
