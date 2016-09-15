class OrganizerMailer < ApplicationMailer
  default :template_path => 'layouts_mailer/organizer'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.organizer_mailer.order.subject
  #
  def order(order_id)
    @order    = Order.find(order_id)
    @user     = @order.user
    @event    = @order.event
    @payment  = @order.payment
    @tickets  = @order.tickets

    @title    = "Someone just booked your event!"
    @subtitle = "And here’s the detail :)"

    if @event.user.nil?
      mail to: "hello@daydash.co", subject: @title, bcc: "bow.kraivanich@gmail.com, daydash.app@gmail.com,nonmadden@gmail.com"
    else
      mail to: @event.user.email, subject: @title, bcc: "bow.kraivanich@gmail.com, hello@daydash.co, daydash.app@gmail.com,nonmadden@gmail.com"
    end
  end
end
