class StaticPagesController < ApplicationController
  def home
    @categories = Category.all
    @artists = Artist.page(params[:page]).per 3
  end
end
