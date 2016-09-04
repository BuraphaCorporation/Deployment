class OrganizerMailer < ApplicationMailer
  default :template_path => 'layouts_mailer/payment'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.organizer_mailer.order.subject
  #
  def order
    @order    = order
    @user     = @order.user
    @event    = @order.event
    @payment  = @order.payment
    @tickets  = @order.tickets

    mail to: @user.email
  end
end

