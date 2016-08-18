class PaymentMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.payment_mailer.checkout.subject
  #
  def order(user)
    @user     = user
    @greeting = "Hi"

    mail to: @user.email
  end

  def ticket(user)
    @user     = user
    @greeting = "Hi"

    mail to: @user.email
  end
end
