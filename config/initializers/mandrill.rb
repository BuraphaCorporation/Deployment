#
Rails.application.configure do
  config.app_domain                         = App.domain
  config.action_mailer.default_url_options  = { host: App.domain }
#   config.action_mailer.delivery_method      = :smtp
#   config.action_mailer.perform_deliveries   = true
#   config.action_mailer.smtp_settings = {
#     address:               "smtp.mandrillapp.com",
#     port:                  25, # ports 587 and 2525 are also supported with STARTTLS
#     enable_starttls_auto:  true, # detects and uses STARTTLS
#     user_name:             ENV["MANDRILL_USERNAME"],
#     password:              ENV["MANDRILL_PASSWORD"], # SMTP password is any valid API key
#     authentication:        'login', # Mandrill supports 'plain' or 'login'
#     domain:                App.domain, # your domain to identify your server when connecting
#   }
end

ActionMailer::Base.smtp_settings = {
  :address   => "smtp.mandrillapp.com",
  :port      => 587,
  :user_name => ENV['MANDRILL_USERNAME'],
  :password  => ENV['MANDRILL_API_KEY'],
  :domain    => 'daydash.co'
}
ActionMailer::Base.delivery_method = :smtp

MandrillMailer.configure do |config|
  config.api_key = ENV['MANDRILL_API_KEY']
  config.deliver_later_queue_name = :default
end
