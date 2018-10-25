class UsersController < ApplicationController
  before_action :find_user, except: %i(new create index)
  before_action :logged_in_user, except: %i(new create)
  before_action :correct_user, only: %i(edit update)
  before_action :admin_user, only: :destroy

  def new
    @user = User.new
  end

  def index
    @users = User.page(params[:page]).per 10
  end

  def show; end

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

  def edit; end

  def update
    if @user.update_attributes user_params
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    flash[:success] = "User deleted."
    redirect_to users_url
  end

  private

    def user_params
      params.require(:user).permit :name, :email, :age, :password, :password_confirmation
    end

    def correct_user
      @user = User.find_by id: params[:id]
      redirect_to root_url unless current_user? @user
    end

    def find_user
      @user = User.find_by id: params[:id]
      if @user
        if @user.id == 1
        redirect_to root_url
        else
          return if @user
          flash.now[:danger] = "Not found user"
          redirect_to users_url
        end
      else
        flash[:danger] = "Not found user"
        redirect_to root_url
      end
    end
end
