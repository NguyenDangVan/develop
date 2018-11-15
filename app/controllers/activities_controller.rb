class ActivitiesController < ApplicationController
  before_action :logged_in_user, only: [:index]
  before_action :correct_user, only: [:index]
  def index
    # @activities = PublicActivity::Activity.select {|s| s.owner_id == @user.id}
    # @activities.reverse!
    @activities = PublicActivity::Activity.where(owner_id: @user.id)
      .order(created_at: :desc).page(params[:page]).per 10
  end

  private

  def logged_in_user
    return if logged_in?
    flash[:danger] = "Please log in."
    redirect_to login_url
  end

  def correct_user
    @user = User.find_by id: params[:user_id]
    redirect_to root_url unless current_user?(@user) || current_user.admin
  end
end
