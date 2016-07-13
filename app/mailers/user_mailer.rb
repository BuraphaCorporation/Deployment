class UserMailer < ApplicationMailer
  default from: 'noreply@daydash.co'

  def welcome_email(user)
    # @user = user
    # @url  = 'http://example.com/login'
    # mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

  def welcome_facebook(user)

  end
end
