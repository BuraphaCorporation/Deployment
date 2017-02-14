# server 'dev-non.wadealike.com', user: 'non', roles: %w{web app db}
# set :deploy_to, '/home/non/wadealike'
# set :stage, 'dev-non'
# set :rails_env, :production
# set :branch, current_git_branch

server 'alpha.wadealike.com', user: 'deploy', roles: %w{web app db}
set :stage, :staging
set :rails_env, :production
set :branch, current_git_branch

# set :branch, git_branch('develop')
