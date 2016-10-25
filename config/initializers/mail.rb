
# ActionMailer::Base.smtp_settings = {
#   authentication: :plain,
#   address:        "smtp.mailgun.org",
#   port:           587,
#   domain:         App.domain,
#   user_name:      ENV['MAILGUN_USERNAME'],
#   password:       ENV['MAILGUN_PASSWORD']
# }

Rails.application.configure do

  config.app_domain                           = App.domain
  config.action_mailer.default_url_options    = { host: App.domain }
  config.action_mailer.delivery_method        = :smtp
  config.action_mailer.perform_deliveries     = true
  config.action_mailer.raise_delivery_errors  = true

  # config.action_mailer.smtp_settings = {
  #   address:               "smtp.mandrillapp.com",
  #   port:                  25, # ports 587 and 2525 are also supported with STARTTLS
  #   enable_starttls_auto:  true, # detects and uses STARTTLS
  #   user_name:             ENV["MANDRILL_USERNAME"],
  #   password:              ENV["MANDRILL_PASSWORD"], # SMTP password is any valid API key
  #   authentication:        'login', # Mandrill supports 'plain' or 'login'
  #   domain:                App.domain, # your domain to identify your server when connecting
  # }

  config.action_mailer.smtp_settings = {
    authentication: :plain,
    address:        "smtp.mailgun.org",
    port:           587,
    domain:         App.domain,
    user_name:      ENV['MAILGUN_USERNAME'],
    password:       ENV['MAILGUN_PASSWORD']
  }

  # ActionMailer::Base.delivery_method = :smtp
end

Mailgun.configure do |config|
  config.api_key = ENV['MAILGUN_API_KEY']
  config.domain  = App.domain
end

$mailgun = Mailgun()
