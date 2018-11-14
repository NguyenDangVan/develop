class UserMailer < ApplicationMailer

  def account_activation user
    @user = user
    mail to: user.email, subject: "Account_activation"
    byebug
  end

  def password_reset user
    @user = user
    mail to: user.email, subject: "Password reset"
  end

  def count_user_active user
    @user = user
    mail to: user.email, subject: "System info"
  end
end
