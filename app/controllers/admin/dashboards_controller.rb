class Admin::DashboardsController < Admin::BaseController
  def index
    q = params[:q]
    @songs = Song.ransack(name_cont: q).result.page(params[:page]).per 10
    @albums = Album.ransack(title_cont: q).result
    @users_chart = User.ransack(age_cont: q).result.page(params[:page])
    @users = User.ransack(name_cont: q).result.page(params[:page]).per 10
    @artists = Artist.ransack(name_cont: q).result.page(params[:page]).per 10
    #EmailWorker.perform_async(1)
    #EmailWorker.perform_at(2.minutes.from_now,1)
  end
end
