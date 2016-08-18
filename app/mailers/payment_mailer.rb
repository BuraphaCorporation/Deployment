class PaymentMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.payment_mailer.checkout.subject
  #
  def order(payment, user, event)
    @payment  = payment
    @user     = user
    @event    = event

    mail to: @user.email
  end

  def ticket(payment, user, event)
    @payment  = payment
    @user     = user
    @event    = event

    mail to: @user.email
  end
end
