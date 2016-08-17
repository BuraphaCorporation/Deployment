class UserMailer < ApplicationMailer
  default from: 'noreply@daydash.co'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome(user)
    @user    = user
    @subject = "Welcome to daydash.co"

    # parameters = {
    #   to:       @user.email,
    #   subject:  @subject
    # }
    # $mailgun.messages.send_email(parameters)
    mail(to: @user.email, subject: 'Welcome to daydash.co')
  end
end
