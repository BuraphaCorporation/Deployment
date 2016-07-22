set :stage, :production

server '54.255.164.167', user: 'deploy', roles: %w{web app db}
