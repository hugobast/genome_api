# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

GenomeApi::Application.load_tasks

namespace :db do
  desc "start postgresql"
  task :up do
    `pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start`
  end
end