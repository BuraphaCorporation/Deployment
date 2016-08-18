class OrganizerMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.organizer_mailer.order.subject
  #
  def order
    @user     = user
    @greeting = "Hi"

    mail to: @user.email
  end
end
