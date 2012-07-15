# Bundler bootstrap
require 'bundler/capistrano'

set :application, "code_critic"
set :deploy_to, "/home/deployer/code_critic"

set :scm, :git
set :repository,  "git@github.com:isotope11/code_critic.git"
set :git_enable_submodules, 1

set :user, "deployer"
set :use_sudo, false
set :branch, "master"
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

# runtime dependencies
depend :remote, :gem, "bundler", "1.0.21"

role :web, "108.166.113.61"                          # Your HTTP server, Apache/etc
role :app, "108.166.113.61"                          # This may be the same as your `Web` server
role :db,  "108.166.113.61", :primary => true        # This is where Rails migrations will run

# tasks
namespace :deploy do
  before 'deploy:setup', :db

  task :start, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end

  task :stop, :roles => :app do
    # Do nothing.
  end

  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end

  desc "Symlink shared resources on each release"
  task :symlink_shared, :roles => :app do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end

  desc "Precompile assets"
  task :precompile_assets, :roles => :app do
    run "cd #{release_path}; RAILS_ENV=production rake assets:precompile"
  end
end

after 'bundle:install', 'deploy:symlink_shared'
after 'deploy:update_code', 'deploy:precompile_assets'
