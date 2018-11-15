class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    @identity = User.from_omniauth(request.env["omniauth.auth"])
    @user = @identity || current_user
    if @user.persisted?
      sign_in @user, :event => :authentication
      #log_in @user, :event => :authentication
      flash[:success] = "Login success"
      redirect_to root_path
    else
      session["devise.#{provider}_data"] = request.env["omniauth.auth"]
      flash[:success] = "Login failure"
      redirect_to new_user_registration_url
      #redirect_to new_user_path
    end
  end
end
