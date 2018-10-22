class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find_by id: params[:id]
    if !@user
      flash[:danger] = "Not found user"
      redirect_to root_url
    end
  end

  def create
    @user = User.new user_params
    if @user.save
      @user.send_activation_email
      flash[:info] = "Please check your email to activate your account"
      redirect_to root_url
    else
      render :new
    end
  end

  private

    def user_params
      params.require(:user).permit :name, :email, :age, :password, :password_confirmation
    end
end
