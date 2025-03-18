class UserMailer < ApplicationMailer
  default reply_to: 'RailsSocialMedia <guisousa.inacio@gmail.com>'

  def welcome_email(user)
    @user = (user || Current.user).as_json

    mail(to: @user[:email_address], subject: "Welcome to the RailsSocialMedia Community!")
  end
end
