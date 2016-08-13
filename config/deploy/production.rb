server 'beta.daydash.co', user: 'deploy', roles: %w{web app db}
set :deploy_to, '/home/deploy/daydash'
set :stage, :production
set :rails_env, :production
set :branch, git_branch('master')
