class Admin::ChartsController < Admin::BaseController

  def index
    @song_charts = Favorite.all
  end
end
