set :stage, :production

server 'api.daydash.co', user: 'deploy', roles: %w{web app}
