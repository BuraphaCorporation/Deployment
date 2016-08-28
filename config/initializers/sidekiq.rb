require 'sidekiq'
require 'sidekiq/web'
# require 'sidekiq/pro/expiry'

Rails.application.config.active_job.queue_adapter = :sidekiq

# Sidekiq::Web.use(Rack::Auth::Basic) do |user, password|
#   [user, password] == ["sidekiqadmin", "yourpassword"]
# end
