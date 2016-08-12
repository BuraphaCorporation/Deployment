set :application, 'Daydash'
set :repo_url, 'git@github.com:hongklay/daydash.git'
set :branch, :master

set :deploy_to, '/home/deploy/daydash'

set :stages, [:staging, :production]
set :default_stage, :staging

# set :format, :pretty
# set :log_level, :debug
set :pty, true

set :linked_files, %w{config/database.yml config/application.yml config/instance.yml}
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/uploads}

set :keep_releases, 5

set :puma_rackup, -> { File.join(current_path, 'config.ru') }
set :puma_state, "#{shared_path}/tmp/pids/puma.state"
set :puma_pid, "#{shared_path}/tmp/pids/puma.pid"
set :puma_bind, "unix://#{shared_path}/tmp/sockets/puma.sock"    #accept array for multi-bind
set :puma_conf, "#{shared_path}/puma.rb"
set :puma_access_log, "#{shared_path}/log/puma_error.log"
set :puma_error_log, "#{shared_path}/log/puma_access.log"
set :puma_role, :app
set :puma_env, fetch(:rack_env, fetch(:rails_env, 'production'))
set :puma_threads, [0, 8]
set :puma_workers, 0
set :puma_worker_timeout, nil
set :puma_init_active_record, true
set :puma_preload_app, false

set :rollbar_token, 'a7c214f1a0164e748d688ef15cc1c9ea'
set :rollbar_env, Proc.new { fetch :stage }
set :rollbar_role, Proc.new { :app }

set :slackistrano, {
  channel: '#system',
  webhook: 'https://hooks.slack.com/services/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'
}

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
          execute :rake, "db:schema:load db:seed"
        end
      end
    end
  end

  after :publishing, 'deploy:restart'
  after :finishing, 'deploy:cleanup'
end

namespace :deploy do
  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end
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
  task :log do
    on roles(:web) do
      within current_path do
        execute :tail, '-f log/puma_error.log'
      end
    end
  end
end
