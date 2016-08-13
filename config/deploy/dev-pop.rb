server 'dev-pop.daydash.co', user: 'pop', roles: %w{web app db}
set :deploy_to, '/home/pop/daydash'
set :stage, 'dev-pop'
set :rails_env, :production
set :branch, current_git_branch
