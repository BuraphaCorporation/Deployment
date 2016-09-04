server 'brick.daydash.co', user: 'deploy', roles: %w{web app db}
set :stage, :staging
set :rails_env, :production

set :sidekiq_role, :app
set :sidekiq_config, "#{current_path}/config/sidekiq.yml"
set :sidekiq_env, 'production'

# Set the deploy branch to the current branch
set :branch, current_git_branch
