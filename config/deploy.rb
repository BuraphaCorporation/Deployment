set :application, 'Daydash'
set :repo_url, 'git@github.com:Hongklay/Daydash.git'

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

  after :publishing, 'deploy:restart'
  after :finishing, 'deploy:cleanup'
end

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
