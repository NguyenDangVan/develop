class Admin::BaseController < ApplicationController
  layout "admin"
  #before_action :logged_in_user
  before_action :require_admin
  before_action :find_total
  before_action :search_all

  def require_admin
    redirect_to root_path unless current_user.admin?
  end

  def find_total
    @total_users = User.count
    @total_songs = Song.count
    @total_albums = Album.count
    @total_artists = Artist.count
  end

  def search_all
    @q = User.ransack(params[:q])
  end

end
