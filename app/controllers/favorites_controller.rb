class FavoritesController < ApplicationController
  before_action :logged_in_user

  def create
    @song = Song.find_by id: params[:song_id].to_i
    current_user.favorite(@song)
    respond_to do |format|
      format.html {redirect_to @song}
      format.js
    end
  end

  def destroy
    @song = Favorite.find(params[:id]).song
    current_user.unfavorite(@song)
    respond_to do |format|
      format.html {redirect_to @song}
      format.js
    end
  end
end
