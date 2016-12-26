# server 'dev-non.daydash.co', user: 'non', roles: %w{web app db}
# set :deploy_to, '/home/non/daydash'
# set :stage, 'dev-non'
# set :rails_env, :production
# set :branch, current_git_branch

server 'alpha.daydash.co', user: 'deploy', roles: %w{web app db}
set :stage, :staging
set :rails_env, :production
set :branch, current_git_branch

# set :branch, git_branch('develop')
