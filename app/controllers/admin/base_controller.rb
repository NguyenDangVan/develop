class Admin::BaseController < ApplicationController
  before_action :logged_in_user
  before_action :check_admin_user

  def check_admin_user
    redirect_to admin_root_url unless current_user.admin?
  end

  def index
    @total_users = User.count
  end
end
