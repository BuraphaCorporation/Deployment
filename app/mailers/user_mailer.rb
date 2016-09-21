class UserMailer < ApplicationMailer
  default :template_path => 'layouts_mailer/user'
  add_template_helper ApplicationHelper

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome(user_id)
    @user    = User.find(user_id)
    @subject = "Welcome to daydash.co"
    mail to: @user.email, subject: @subject
  end

  def order(order_id)
    @order    = Order.find(order_id)
    @user     = @order.user
    @event    = @order.event
    @payment  = @order.payment
    @tickets  = @order.tickets

    @title     = "Hi #{@user.first_name}, we’ve got your order!"
    @subtitle = "Just one more step :)"

    mail to: @user.email, subject: "Daydash.co - Payment Pending: #{@event.title}"
  end

  def ticket(order_id)
    @order    = Order.find(order_id)
    @user     = @order.user
    @event    = @order.event
    @payment  = @order.payment
    @tickets  = @order.tickets

    @title     = "Hi #{@user.first_name}, here’s your tickets!"
    @subtitle = "It's time to get excited!"

    mail to: @user.email, subject: "Daydash.co - Your Tickets: #{@event.title}"
  end

  def reminder(order_id)
    @order    = Order.find(order_id)
    @user     = @order.user
    @event    = @order.event
    @payment  = @order.payment
    @tickets  = @order.tickets

    @title = "reminder"

    mail to: @user.email, subject: @title
  end
end
