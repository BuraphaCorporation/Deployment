server 'dev-non.daydash.co', user: 'non', roles: %w{web app db}
set :deploy_to, '/home/non/daydash'
set :stage, 'dev-non'
set :rails_env, :production
set :branch, current_git_branch
