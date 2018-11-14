class Admin::UsersController < Admin::BaseController

  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true).page(params[:page]).per 10
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
