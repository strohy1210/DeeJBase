require 'bundler/capistrano' # for bundler support

set :application, "deejbase"
set :repository,  "https://github.com/strohy1210/DeeJBase"

set :user, 'SARAH'
set :deploy_to, "/home/SARAH/deejbase"
set :use_sudo, false

set :scm, :git

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
default_run_options[:pty] = true

role :web, "104.236.78.24"                          # Your HTTP server, Apache/etc
role :app, "104.236.78.24"                          # This may be the same as your `Web` server
# role :db,  "djbase_dev_db", :primary => true # This is where Rails migrations will run
# role :db,  "djbase_dev_db"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end