server 'dev-pop.daydash.co', user: 'pop', roles: %w{web app db}
set :stage, 'dev-pop'
set :rails_env, :production
set :deploy_to, '/home/pop/dev-pop'
set :branch, git_branch('dev-pop')
