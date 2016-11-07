class OrganizerMailer < ApplicationMailer
  default :template_path => 'layouts_mailer/organizer'
  add_template_helper ApplicationHelper

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

    @link_to_order = "#{App.domain}/organizer/events/#{@event.slug}/orders"

    if @event.user.nil?
      mail to: "hello@daydash.co", subject: @title, bcc: "daydash.app@gmail.com"
    else
      mail to: @event.user.email, subject: @title, bcc: "hello@daydash.co, daydash.app@gmail.com"
    end
  end

  def test
    mail to: "hello@daydash.co", subject: "ทดสอบ"
  end
end
