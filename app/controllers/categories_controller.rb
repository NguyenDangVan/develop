class CategoriesController < ApplicationController

  def new
    @category = Category.new
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
    @categories = Category.page(params[:page]).per 10
  end

  def show
    @category = Category.find_by id: params[:id]
  end

  private

    def categories_params
      params.require(:category).permit :name
    end
end
