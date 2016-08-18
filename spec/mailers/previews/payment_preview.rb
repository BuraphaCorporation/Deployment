# Preview all emails at http://localhost:3000/rails/mailers/payment_mailer
class PaymentPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/payment_mailer/checkout
  def order
    PaymentMailer.order(User.first)
  end

  def ticket
    PaymentMailer.ticket(User.first)
  end

end
