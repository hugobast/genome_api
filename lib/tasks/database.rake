namespace :db do
  desc "start postgresql"
  task :up do
    `pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start`
  end
end