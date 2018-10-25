class CategoriesController < ApplicationController
  before_action :logged_in_user, except: %i(show index)
  before_action :admin_user, only: %i(new create destroy)

  def new
    if !current_user.admin?
      redirect_to root_url
      flash.now[:danger] = "You can't access"
    else
      @category = Category.new
    end
  end

  def create
    @category = Category.new categories_params
    if @category.save
      flash[:success] = "added category"
      redirect_to @category
    else
      render :new
    end
  end

  def index
    @q = Category.ransack(params[:q])
    @categories = @q.result.page(params[:page]).per 10
  end

  def show
    @category = Category.find_by id: params[:id]
    @albums = @category.albums.ordered_by_create_at.page(params[:page]). per 3
  end

  def destroy
    @category = Category.find_by id: params[:id]
    @category.destroy
    flash[:success] = "Category deleted"
    redirect_to categories_url
  end

  private

    def categories_params
      params.require(:category).permit :name
    end
end
