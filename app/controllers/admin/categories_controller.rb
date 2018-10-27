class Admin::CategoriesController < Admin::BaseController

  def index
    if params[:search]
      @categories = Category.search_category_name(params[:search]).page(params[:page]).per 10
    else
      @categories = Category.page(params[:page]).per 10
    end
  end
end
