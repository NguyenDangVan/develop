class Admin::BaseController < ApplicationController
  layout "admin"
  before_action :logged_in_user
  before_action :require_admin

  def require_admin
    redirect_to root_path unless current_user.admin?
  end

  def index
    @total_users = User.count
  end
end
