# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/welcome
  def welcome
    UserMailer.welcome(User.first)
  end

  def reminder
    UserMailer.reminder(User.first)
  end
end
