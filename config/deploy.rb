
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

# set :slackistrano, {
#   channel: '#system',
#   webhook: 'https://hooks.slack.com/services/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'
# }

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

  desc 'run workers'
  task :workers do
    on roles(:app), in: :sequence, wait: 5 do
      execute "su - deploy -c 'cd /home/deploy/daydash/current && $HOME/.rbenv/bin/rbenv exec bundle exec sidekiq -i 5 -e production' > /dev/null 2>&1 &"
    end
  end

  task :generate_error_html do
    on roles(:web) do |host|
      public_500_html = File.join(release_path, "public/500.html")
      execute :curl, "-k", "https://brick.daydash.co/500", "> #{public_500_html}"

      public_404_html = File.join(release_path, "public/404.html")
      execute :curl, "-k", "https://brick.daydash.co/404", "> #{public_404_html}"
      public_402_html = File.join(release_path, "public/402.html")
      execute :curl, "-k", "https://brick.daydash.co/404", "> #{public_402_html}"
    end
  end

  after :finishing, 'deploy:cleanup'
  after :publishing, 'deploy:restart'
  after "deploy:published", :generate_error_html

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


# namespace :sidekiq do
#   task :quiet do
#     on roles(:app) do
#       puts capture("pgrep -f 'workers' | xargs kill -USR1")
#     end
#   end
#   task :restart do
#     on roles(:app) do
#       execute :sudo, :initctl, :restart, :workers
#     end
#   end
# end

# after 'deploy:starting', 'sidekiq:quiet'
# after 'deploy:reverted', 'sidekiq:restart'
# after 'deploy:published', 'sidekiq:restart'
