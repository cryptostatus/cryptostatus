role :app, %w{deployer@146.185.149.237}
role :web, %w{deployer@146.185.149.237}
role :db,  %w{deployer@146.185.149.237}

set :branch, fetch(:branch, 'master')
set :deploy_to, '/home/deployer/www/cryptostatus'
