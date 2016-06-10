set :stage, :production

server '188.166.182.150', user: 'deploy', roles: %w{web app}
