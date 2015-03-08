# -*- encoding : utf-8 -*-
require 'rvm/capistrano'
require 'bundler/capistrano'

load 'deploy/assets'

set :rake, "#{rake} --trace"

set :application, "iwant"
set :rails_env, "production"

set :repository,  "git@github.com:Kasutajanimi/iwnt.git"
set :scm, :git
set :deploy_via, :remote_cache #set :deploy_via, :checkout
set :ssh_options, { :forward_agent => true }
default_run_options[:pty] = true
#set :default_shell, "/bin/bash -l"

server "195.154.64.106", :app, :web, :db, :primary => true
#server "10.8.0.1", :app, :web, :db, :primary => true
#server "95.211.216.150", :app, :web, :primary => true

set :bundle_without,  [:test, :development]

set :user, 'kasutajanimi'
set :deploy_to, "/home/kasutajanimi/appz/iwant/"
set :branch, "master" unless exists?(:branch)
set :use_sudo, false

set :rvm_type, :user
set :rvm_ruby_string, 'ruby-2.0.0' # set :rvm_ruby_string, 'ruby-1.9.3-p327@lavio'

before 'deploy:setup', 'rvm:install_rvm', 'rvm:install_ruby', 'rvm:create_gemset'

set :unicorn_conf, "#{deploy_to}/current/config/unicorn.rb"
set :unicorn_pid, "#{deploy_to}/shared/pids/unicorn.pid"

after "deploy", "deploy:migrate"
after "deploy", "deploy:cleanup"

namespace :deploy do
  task :restart do
    run "if [ -f #{unicorn_pid} ]; then kill -USR2 `cat #{unicorn_pid}`; else cd #{deploy_to}/current && bundle exec unicorn -c #{unicorn_conf} -E #{rails_env} -D; fi"
  end
  task :start do
    run "cd #{deploy_to}/current && bundle exec unicorn -c #{unicorn_conf} -E #{rails_env} -D;"
  end
  task :stop do
    run "if [ -f #{unicorn_pid} ] && [ -e /proc/$(cat #{unicorn_pid}) ]; then kill -QUIT `cat #{unicorn_pid}`; fi"
  end

end

# http://github.com/jamis/capistrano/blob/master/lib/capistrano/recipes/deploy.rb
# :default -> update, restart
# :update  -> update_code, symlink

# after 'deploy:assets:precompile' do
#   run "node #{shared_path}/r.js -o ./assets/config.js"
# end

