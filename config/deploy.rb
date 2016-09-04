
# Bonus! Colors are pretty!
def red(str)
  "\e[31m#{str}\e[0m"
end

def git_branch(branch)
  puts "Deploying branch #{red branch}"
  branch
end

# Figure out the name of the current local branch
def current_git_branch
  branch = `git symbolic-ref HEAD 2> /dev/null`.strip.gsub(/^refs\/heads\//, '')
  git_branch branch
end

set :application, 'Daydash'
set :repo_url, 'git@github.com:hongklay/daydash.git'
set :deploy_to, '/home/deploy/daydash'
set :ssh_options, {:forward_agent => true}

set :slackistrano, {
  channel: '#system',
  webhook: 'https://hooks.slack.com/services/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'
}

# set :format, :pretty
# set :log_level, :debug
set :pty, true

set :linked_files, %w{config/database.yml config/application.yml config/instance.yml}
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/uploads}

set :keep_releases, 50

set :rollbar_token, 'a7c214f1a0164e748d688ef15cc1c9ea'
set :rollbar_env, Proc.new { fetch :stage }
set :rollbar_role, Proc.new { :app }

namespace :deploy do
  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  desc 'Runs rake db:seed'
  task :seed => [:set_rails_env] do
    on primary fetch(:migration_role) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :rake, "db:schema:load db:seed DISABLE_DATABASE_ENVIRONMENT_CHECK=1"
        end
      end
    end
  end

  after :finishing, 'deploy:cleanup'
  after :publishing, 'deploy:restart'
  # after "deploy:published", "restart_sidekiq"
end

namespace :rails do
  desc 'Console to production'
  task :console do
    on roles(:web) do
      within current_path do
        execute :rails, 'console production'
      end
    end
  end

  desc "Task log"
  task :logs do
    on roles(:web) do
      within current_path do
        execute :tail, '-f log/puma_error.log'
      end
    end
  end
end



# # config/deploy.rb
# namespace :upstart do
#   desc 'Generate and upload Upstard configs for daemons needed by the app'
#   task :update_configs, except: {no_release: true} do
#     upstart_config_files = File.expand_path('../upstart/*.conf.erb', __FILE__)
#     upstart_root         = '/etc/init'

#     Dir[upstart_config_files].each do |upstart_config_file|
#       config = ERB.new(IO.read(upstart_config_file)).result(binding)
#       path   = "#{upstart_root}/#{File.basename upstart_config_file, '.erb'}"

#       put config, path
#     end
#   end
# end

# after 'deploy:update_code', 'upstart:update_configs'

# # Add this to your /etc/sudoers file in order to allow the user
# # www-data to control the Sidekiq worker daemon via Upstart:
# #
# #   www-data ALL = (root) NOPASSWD: /sbin/start sidekiq, /sbin/stop sidekiq, /sbin/status sidekiq
# namespace :sidekiq do
#   desc 'Start the sidekiq workers via Upstart'
#   task :start do
#     sudo 'start sidekiq'
#   end

#   desc 'Stop the sidekiq workers via Upstart'
#   task :stop do
#     sudo 'stop sidekiq || true'
#   end

#   desc 'Restart the sidekiq workers via Upstart'
#   task :restart do
#     sudo 'stop sidekiq || true'
#     sudo 'start sidekiq'
#   end

#   desc "Quiet sidekiq (stop accepting new work)"
#   task :quiet do
#     pid_file       = "#{current_path}/tmp/pids/sidekiq.pid"
#     sidekiqctl_cmd = "bundle exec sidekiqctl"
#     run "if [ -d #{current_path} ] && [ -f #{pid_file} ] && kill -0 `cat #{pid_file}`> /dev/null 2>&1; then cd #{current_path} && #{sidekiqctl_cmd} quiet #{pid_file} ; else echo 'Sidekiq is not running'; fi"
#   end
# end

# # before 'deploy:update_code', 'sidekiq:quiet'
# after  'deploy:stop',        'sidekiq:stop'
# after  'deploy:start',       'sidekiq:start'
# before 'deploy:restart',     'sidekiq:restart'
