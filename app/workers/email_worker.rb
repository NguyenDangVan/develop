class EmailWorker
  include Sidekiq::Worker
  sidekiq_options retry: false
  #sidekiq_options queue: :people, retry: 2, backtrace: true

  # def perform(user_id)
  #   user_number_registed = User.where(:activated => false).count
  #   user = User.find(@user_id)
  #   UserMailer.activation(user).deliver
  #   mail(to: User.first.email, subject: 'There are ')
  # end
  def perform user
    UserMailer.account_activation(user).deliver_now
    #UserMailer.count_user_active(user).deliver_now
  end
end
