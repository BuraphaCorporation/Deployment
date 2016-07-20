
set :stage, :production

server 'brick.daydash.co', user: 'deploy', roles: %w{web app}

