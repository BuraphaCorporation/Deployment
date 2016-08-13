set :stage, :production
server 'beta.daydash.co', user: 'deploy', roles: %w{web app db}
