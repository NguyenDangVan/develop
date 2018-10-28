class Admin::UsersController < Admin::BaseController

  def index
    if params[:search]
      @users = User.search_user_name(params[:search]).page(params[:page]).per 15
    else
      @users = User.page(params[:page]).per 15
    end
  end
end
