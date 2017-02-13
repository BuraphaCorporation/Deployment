server 'alpha.thekanko.com', user: 'deploy', roles: %w{web app db}
set :stage, :staging
set :rails_env, :production
set :branch, git_branch('develop')
