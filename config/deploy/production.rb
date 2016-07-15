set :stage, :production

server 'daydash.co', user: 'deploy', roles: %w{web app}
