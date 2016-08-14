# class UserMailer < ApplicationMailer
class UserMailer < MandrillMailer::TemplateMailer
  default from: 'noreply@daydash.co'

  def welcome(user)
    mandrill_mail(
      from: 'noreply@daydash.co',
      from_name: "Daydash.co",
      template: 'welcome',
      subject: 'welcome',
      to: { email: user.email },
      vars: {
        "FIRST_NAME"    => user.first_name,
        "LAST_NAME"     => user.last_name,
        "EMAIL"         => user.email,
      },
      important: true,
      inline_css: true
    )
  end

  # def welcome_email(user)
  #   # @user = user
  #   # @url  = 'http://example.com/login'
  #   # mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  # end
  #
  # def welcome_facebook(user)
  #
  # end
end
