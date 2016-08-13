server 'dev-pop.daydash.co', user: 'pop', roles: %w{web app db}
set :stage, 'dev-pop'
set :rails_env, :production
set :deploy_to, '/home/pop/daydash'
set :branch, current_git_branch
