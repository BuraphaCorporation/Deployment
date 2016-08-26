server 'brick.daydash.co', user: 'deploy', roles: %w{web app db}
set :stage, :staging
set :rails_env, :production

# Set the deploy branch to the current branch
set :branch, current_git_branch
