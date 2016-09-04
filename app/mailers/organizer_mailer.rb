class OrganizerMailer < ApplicationMailer
  default :template_path => 'layouts_mailer/organizer'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.organizer_mailer.order.subject
  #
  def order(order)
    @order    = order
    @user     = @order.user
    @event    = @order.event
    @payment  = @order.payment
    @tickets  = @order.tickets

    @title    = "Someone just booked your event!"
    @subtitle = "And here’s the detail :)"

    mail to: @event.user.email, cc: "hello@daydash.co"
  end
end

