load 'deploy' if respond_to?(:namespace) # cap2 differentiator


set :application, "smart"
set :user, "bbarrows"
#set :password, "asdf"

set :scm, :git
set :repository,  "git@github.com:bbarrows/smart.git"
set :deploy_via, :remote_cache
set :deploy_to, "/home/#{user}/#{application}"

role :app, "bbarrows.com"
role :web, "bbarrows.com"
role :db, "bbarrows.com", :primary => true

set :runner, user
set :admin_runner, user

after 'deploy:update', 'deploy:restart'

namespace :deploy do
  task :restart, :roles => [:web, :app] do
    run "cd #{deploy_to}/current/tmp && touch restart.txt && rm #{deploy_to}/current/public/index.html"
  end
end
