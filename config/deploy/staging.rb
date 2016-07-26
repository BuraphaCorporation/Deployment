set :stage, :staging
server 'staging.daydash.co', user: 'deploy', roles: %w{web app db}
set :rails_env, :production

# Bonus! Colors are pretty!
def red(str)
  "\e[31m#{str}\e[0m"
end

# Figure out the name of the current local branch
def current_git_branch
  branch = `git symbolic-ref HEAD 2> /dev/null`.strip.gsub(/^refs\/heads\//, '')
  puts "Deploying branch #{red branch}"
  branch
end

# Set the deploy branch to the current branch
set :branch, current_git_branch
