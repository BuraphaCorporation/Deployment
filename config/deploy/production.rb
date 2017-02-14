server 'wadealike.com', user: 'deploy', roles: %w{web app db}
set :stage, :production
set :rails_env, :production

set :branch, if ENV['BRANCH']
  git_branch(ENV['BRANCH'])
else
  git_branch('master')
end
