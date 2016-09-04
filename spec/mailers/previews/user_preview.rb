# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/welcome
  def welcome
    UserMailer.welcome(User.first)
  end

  def order
    UserMailer.order(Order.first)
  end

  def ticket
    UserMailer.ticket(Order.first)
  end

  def reminder
    UserMailer.reminder(Order.first)
  end
end
