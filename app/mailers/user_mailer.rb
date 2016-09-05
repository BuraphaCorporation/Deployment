class UserMailer < ApplicationMailer
  default :template_path => 'layouts_mailer/user'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome(user)
    @user    = user
    @subject = "Welcome to daydash.co"

    mail to: @user.email, subject: 'Welcome to daydash.co'
  end

  def order(order)

    @order    = order
    @user     = @order.user
    @event    = @order.event
    @payment  = @order.payment
    @tickets  = @order.tickets

    @title     = "Hi #{@user.first_name}, we’ve got your order!"
    @subtitle = "Just one more step :)"

    mail to: @user.email, subject: @title
  end

  def ticket(order)
    @order    = order
    @user     = @order.user
    @event    = @order.event
    @payment  = @order.payment
    @tickets  = @order.tickets

    @title = "your ticket"

    mail to: @order.email, subject: @title
  end

  def reminder(order)
    @order    = order
    @user     = @order.user
    @event    = @order.event
    @payment  = @order.payment
    @tickets  = @order.tickets

    @title = "reminder"

    mail to: @user.email, subject: @title
  end
end
