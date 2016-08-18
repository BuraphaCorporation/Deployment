class OrganizerMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.organizer_mailer.order.subject
  #
  def order
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
