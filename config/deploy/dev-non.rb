server 'dev-non.daydash.co', user: 'non', roles: %w{web app db}
set :stage, 'dev-non'
set :rails_env, :production
set :deploy_to, '/home/non/daydash'
set :branch, current_git_branch
