class Admin::UsersController < Admin::BaseController

  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true).page(params[:page]).per 10
  end

  def search
    @users = User.ransack(name_cont: params[:q]).result(distinct: true).limit(5)

    respond_to do |format|
      format.html {}
      format.json {
        @users = @users.limit(10)
      }
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
