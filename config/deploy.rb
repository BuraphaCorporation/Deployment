set :application, 'Daydash'
set :repo_url, 'git@github.com:hongklay/daydash.git'

set :deploy_to, '/home/deploy/daydash'

set :linked_files, %w{config/database.yml}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

set :branch, fetch(:branch, "develop")

set :stages, ["staging", "production"]
set :default_stage, "staging"

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
          execute :rake, "db:seed"
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

namespace :deploy do
  desc 'Says a message when deployment is completed'
  task :say do
    system("\\say Capistrano Deployment Completed! Good Job!")
  end
end

after :finished, 'deploy:say'
# namespace :bower do
#   desc 'Install bower'
#   task :install do
#     on roles(:web) do
#       within release_path do
#         execute :rake, 'bower:install CI=true'
#       end
#     end
#   end
# end
# before 'deploy:compile_assets', 'bower:install'
