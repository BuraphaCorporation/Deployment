class OrganizerMailer < ApplicationMailer
  default template_path: 'mailers/organizer'
  add_template_helper ApplicationHelper

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.organizer_mailer.order.subject
  #
  def order(order_id)
    @organizer = true
    @order    = Order.find(order_id)
    @user     = @order.user
    @event    = @order.event
    @payment  = @order.payment
    @tickets  = @order.tickets

    @title    = "Someone just booked your event!"
    @subtitle = "And here’s the detail :)"

    @link_to_order = "#{App.domain}/organizer/events/#{@event.slug}/orders"

    if @event.user.nil?
      mail to: "wadealike@gmail.com", subject: @title, bcc: "wadealike@gmail.com, wadealike.app@gmail.com"
    else
      mail to: @event.user.email, subject: @title, bcc: "wadealike@gmail.com, wadealike.app@gmail.com"
    end
  end

  def test
    mail to: "wadealike@gmail.com", subject: "ทดสอบ"
  end
end
