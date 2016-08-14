class PaymentMailer < MandrillMailer::TemplateMailer
  default from: 'noreply@daydash.co'

  def checkout(user, payment)
    mandrill_mail(
      from: 'noreply@daydash.co',
      from_name: "Daydash.co",
      template: 'payment',
      subject: "Payment #{payment.code}",
      to: { email: user.email },
      vars: {
        "NAME"           => "#{user.firstname} #{user.last_name} ",
        "PAYMENT_CODE"   => payment.code,
        "PAYMENT_STATUS" => payment.status,
      },
      important: true,
      inline_css: true
    )
  end
end
