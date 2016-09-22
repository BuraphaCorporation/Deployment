# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/welcome

  def welcome
    UserMailer.welcome(User.first.id)
  end

  def order
    order = Payment.where(methods: 'transfer').first.order
    UserMailer.order(order.id)
  end

  # def order_omise
  #   order = Payment.where(methods: 'omise').first.order
  #   UserMailer.order(order.id)
  # end

  def ticket
    order = Payment.where(methods: 'omise').first.order
    UserMailer.ticket(order.id)
  end

  def reminder
    UserMailer.reminder(Order.first.id)
  end
end
