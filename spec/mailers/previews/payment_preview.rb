# Preview all emails at http://localhost:3000/rails/mailers/payment_mailer
class PaymentPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/payment_mailer/checkout
  def order
    payment = Payment.last
    PaymentMailer.order(payment, payment.user, payment.event)
  end

  def ticket
    payment = Payment.last
    PaymentMailer.order(payment, payment.user, payment.event)
  end
end
