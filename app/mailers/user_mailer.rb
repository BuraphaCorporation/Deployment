class UserMailer < ApplicationMailer
  default :template_path => 'mailers/user'
  add_template_helper ApplicationHelper

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #

  def welcome(user_id)
    @user    = User.find(user_id)
    @subject = "Welcome to thekanko.co"
    mail to: @user.email, subject: @subject, bcc: "hello@thekanko.co, thekanko.app@gmail.com"
  end

  def order(order_id)
    @order    = Order.find(order_id)
    @user     = @order.user
    @event    = @order.event
    @payment  = @order.payment
    @tickets  = @order.tickets

    @title    = "Hi #{@user.first_name}, we’ve got your order!"
    @subtitle = "Just one more step :)"

    @link_to_order = "#{App.domain}/profile/#{@user.id}/orders"

    mail to: @user.email, subject: "TheKanko.co - Payment #{@order.status}: #{@event.title}", bcc: "hello@thekanko.co, thekanko.app@gmail.com"
  end

  def ticket(order_id)
    @order    = Order.find(order_id)
    @user     = @order.user
    @event    = @order.event
    @payment  = @order.payment
    @tickets  = @order.tickets

    @title     = "Hi #{@user.first_name}, here’s your tickets!"
    @subtitle = "It's time to get excited! 😎"

    @link_to_order = "#{App.domain}/profile/#{@user.id}/orders"

    mail to: @user.email, subject: "TheKanko.co - Your Tickets: #{@event.title}", bcc: "hello@thekanko.co, thekanko.app@gmail.com"
  end

  def reminder(order_id)
    @order    = Order.find(order_id)
    @user     = @order.user
    @event    = @order.event
    @payment  = @order.payment
    @tickets  = @order.tickets

    @title = "Something cool will happen tomorrow"
    @subtitle = "Because you can :)"

    @link_to_order = "#{App.domain}/profile/#{@user.id}/orders"

    mail to: @user.email, subject: "TheKanko.co - พรุ่งนี้แล้ว! #{@event.title}", bcc: "thekanko.app@gmail.com"
  end
end
