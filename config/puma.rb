
directory '/home/non/daydash/current'
rackup "/home/non/daydash/current/config.ru"
environment 'production'

pidfile "daydash/shared/tmp/pids/puma.pid"
state_path "daydash/shared/tmp/pids/puma.state"
stdout_redirect 'daydash/shared/log/puma_error.log', 'daydash/shared/log/puma_access.log', true


threads 0,8

bind 'unix://daydash/shared/tmp/sockets/puma.sock'

workers 0



prune_bundler


on_restart do
  puts 'Refreshing Gemfile'
  ENV["BUNDLE_GEMFILE"] = "/home/non/daydash/current/Gemfile"
end

# if App.environment != 'development'
#   current_path = ENV.fetch("ROOT_PATH")
#
#   directory "#{current_path}/current"
#   rackup "#{current_path}/current/config.ru"
#   environment 'production'
#
#   pidfile "#{current_path}/shared/tmp/pids/puma.pid"
#   state_path "#{current_path}/shared/tmp/pids/puma.state"
#   stdout_redirect 'daydash/shared/log/puma_error.log', 'daydash/shared/log/puma_access.log', true
#   threads 0,8
#
#   sock = "unix://#{current_path}/shared/tmp/sockets/puma.sock"
#   puts sock
#   bind sock
#
#   workers 0
#
#   prune_bundler
#
#   on_restart do
#     puts 'Refreshing Gemfile'
#     ENV["BUNDLE_GEMFILE"] = "#{current_path}current/Gemfile"
#   end
# else
#   # Puma can serve each request in a thread from an internal thread pool.
#   # The `threads` method setting takes two numbers a minimum and maximum.
#   # Any libraries that use thread pools should be configured to match
#   # the maximum value specified for Puma. Default is set to 5 threads for minimum
#   # and maximum, this matches the default thread size of Active Record.
#   #
#
#   threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }.to_i
#   threads threads_count, threads_count
#
#   # Specifies the `port` that Puma will listen on to receive requests, default is 3000.
#   #
#   port        ENV.fetch("PORT") { 3000 }
#
#   # Specifies the `environment` that Puma will run in.
#   #
#   environment ENV.fetch("RAILS_ENV") { "development" }
#
#   # Specifies the number of `workers` to boot in clustered mode.
#   # Workers are forked webserver processes. If using threads and workers together
#   # the concurrency of the application would be max `threads` * `workers`.
#   # Workers do not work on JRuby or Windows (both of which do not support
#   # processes).
#   #
#   # workers ENV.fetch("WEB_CONCURRENCY") { 2 }
#
#   # Use the `preload_app!` method when specifying a `workers` number.
#   # This directive tells Puma to first boot the application and load code
#   # before forking the application. This takes advantage of Copy On Write
#   # process behavior so workers use less memory. If you use this option
#   # you need to make sure to reconnect any threads in the `on_worker_boot`
#   # block.
#   #
#   # preload_app!
#
#   # The code in the `on_worker_boot` will be called if you are using
#   # clustered mode by specifying a number of `workers`. After each worker
#   # process is booted this block will be run, if you are using `preload_app!`
#   # option you will want to use this block to reconnect to any threads
#   # or connections that may have been created at application boot, Ruby
#   # cannot share connections between processes.
#   #
#   # on_worker_boot do
#   #   ActiveRecord::Base.establish_connection if defined?(ActiveRecord)
#   # end
#
#   # Allow puma to be restarted by `rails restart` command.
#   plugin :tmp_restart
# end
