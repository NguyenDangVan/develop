class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by email: params[:session][:email].downcase
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        if current_user.admin?
          redirect_to admin_root_url
        else
          params[:session][:remember_me] == '1' ? remember(user) : forget(user)
          redirect_back_or user
        end
      else
        message = "Account not activated. Check your email for the activation link."
        flash[:warning] = message
        redirect_to root_url
      end
    else
      flash.now[:danger]  = "Invalid email/password"
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    if @check_current_user.admin
      redirect_to login_path
    else
      redirect_to root_url
    end
  end
end
