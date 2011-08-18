load 'deploy' if respond_to?(:namespace) # cap2 differentiator

set :application, "smart"
set :user, "bbarrows"
set :password, "102587Beb"

set :scm, :git
set :repository,  "git@github.com:bbarrows/smart.git"
set :deploy_via, :remote_cache
set :deploy_to, "/home/#{user}/#{application}"

role :app, "bbarrows.com"
role :web, "bbarrows.com"
role :db, "bbarrows.com", :primary => true

set :runner, user
set :admin_runner, user

namespace :deploy do
  task :start, :roles => [:web, :app] do
    run "cd #{deploy_to}/tmp && touch restart.txt"
  end
end
