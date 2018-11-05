class UsersController < ApplicationController
  before_action :find_user, except: %i(new create index)
  before_action :logged_in_user, except: %i(new create)
  before_action :correct_user, only: [:update, :edit]
  before_action :admin_user, only: :destroy

  def new
    @user = User.new
  end

  def index
    if params[:search]
      @users = User.search_user_name(params[:search]).page(params[:page]).per 10
    else
      @users = User.page(params[:page]).per 10
    end
  end

  def show
    @user = User.find_by id: params[:id]
    if !@user
      flash[:danger] = "Not found user"
      redirect_to root_url
    end
    @playlists = @user.playlists.page(params[:page]).per 10
  end

  def create
    @user = User.new user_params
    if @user.save
      @user.send_activation_email
      flash[:info] = t ".pls_check"
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
    if @user.admin?
      flash.now[:success] = "You can't delete admin"
    elsif @user.destroy
      flash.now[:success] = "Delete successfull"
    else
      flash.now[:danger] = "Delete unsuccessfull"
    end
    redirect_to admin_users_path
  end

  def favorite_songs
    @title = "My favourite"
    @user = User.find_by id: params[:id]
    @user_songs = @user.favorite_songs.page(params[:page]).per 10
    render "show_favorite"
  end

  private

    def user_params
      params.require(:user).permit :name, :email, :age, :password, :password_confirmation
    end

    def correct_user
      @user = User.find_by id: params[:id]
      redirect_to root_url unless current_user?(@user) || current_user.admin
    end

    def find_user
      @user = User.find_by id: params[:id]
      return if @user
      flash[:danger] = "Not found user"
      redirect_to root_url
    end
end
