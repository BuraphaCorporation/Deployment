set :stage, :personal_develop

set :repository, '.'
set :branch, 'dev-pop'

server 'dev-pop.daydash.co', user: 'deploy', roles: %w{web app db}
set :deploy_to, '/home/deploy/daydash'
