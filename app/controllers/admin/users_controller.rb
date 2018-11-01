class Admin::UsersController < Admin::BaseController

  def index
    if params[:search]
      @users = User.search_user_name(params[:search]).page(params[:page]).per 15
    else
      @users = User.page(params[:page]).per 15
    end
  end

  def destroy
    @user = User.find_by id: params[:id]
    if @user.destroy
      flash[:success] = "Delete successfull"
      redirect_to admin_users_path
    else
      flash[:danger] = "Delete unsuccessfull"
      redirect_to admin_users_path
    end
  end
end
