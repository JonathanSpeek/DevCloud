class NewUserMailer < ApplicationMailer
  default from: 'jonathanspeek@gmail.com'

  def new_user_email(user)
    @user = user
    mail(to: 'jonspeek@gmail.com', subject: 'New User on DevCloud')
  end
end
