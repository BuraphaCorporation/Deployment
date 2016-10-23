
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
set :repo_url, 'git@github.com:justfuckingdoit/daydash.git'
set :deploy_to, '/home/deploy/daydash'
set :deploy_user, 'deploy'
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

  desc 'run workers'
  task :restart_workers do
    on roles(:app), in: :sequence, wait: 5 do
      execute :sudo, "systemctl restart sidekiq"
    end
  end

  desc 'Bower Install'
  task :bower_install do
    on roles(:app), in: :sequence, wait: 5 do
      within release_path do
        execute :bower, :install
      end
    end
  end

  before 'deploy:assets:precompile', :bower_install
  after :finishing, 'deploy:cleanup'
  after :publishing, 'deploy:restart'
  after :published, :restart_workers
end

namespace :setup do
  desc 'Runs rake db:seed'
  task :seed do
    on primary fetch(:migration_role) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :rake, "db:schema:load db:seed DISABLE_DATABASE_ENVIRONMENT_CHECK=1"
        end
      end
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
end

namespace :rails do
  desc "Remote console"
  task :console do
    on roles(:app), primary: true do
      run_interactively "bundle exec rails console"
    end
  end

  desc "Remote dbconsole"
  task :dbconsole do
    on roles(:app), primary: true do
      run_interactively "bundle exec rails dbconsole"
    end
  end

  desc "Remote log"
  task :log do
    on roles(:web) do
      within current_path do
        execute :sudo, 'tail -f /var/log/nginx/error.log'
      end
    end
  end

  def run_interactively(command, server=nil)
    exec "ssh #{fetch(:deploy_user)}@#{host} -t 'cd #{deploy_to}/current && #{bundle_cmd_with_rbenv} #{command} #{fetch(:rails_env)}'"
  end

  def bundle_cmd_with_rbenv
    if fetch(:rbenv_ruby)
      "RBENV_VERSION=#{fetch(:rbenv_ruby)} RBENV_ROOT=#{fetch(:rbenv_path)} #{File.join(fetch(:rbenv_path), '/bin/rbenv')} exec bundle exec"
    else
      "ruby "
    end
  end
end
