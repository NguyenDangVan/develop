class Admin::DashboardsController < Admin::BaseController

  def index
    @total_users = User.count
  end
end
