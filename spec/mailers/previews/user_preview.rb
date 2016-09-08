# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/welcome
  def welcome
    UserMailer.welcome(User.first.id)
  end

  def order
    UserMailer.order(Order.first.id)
  end

  def ticket
    UserMailer.ticket(Order.first.id)
  end

  def reminder
    UserMailer.reminder(Order.first.id)
  end
end
