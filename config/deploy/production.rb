role :app, %w{deployer@production_ip}
role :web, %w{deployer@production_ip}
role :db,  %w{deployer@production_ip}

set :branch, fetch(:branch, 'master')
set :deploy_to, '/home/deployer/www/cryptostatus'
