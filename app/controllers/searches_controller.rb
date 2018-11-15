class SearchesController < ApplicationController
  def index
    @users = User.search(params[:term])
    render json: @users.map{|user| name: user.name}
  end
end
