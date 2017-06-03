return if Rails.env.test? || Rails.env.development? rescue nil

app_path = '/home/deployer/www/cryptostatus'

directory "#{app_path}/current"
rackup "#{app_path}/current/config.ru"
daemonize true
pidfile "#{app_path}/shared/tmp/pids/puma.pid"
state_path "#{app_path}/shared/tmp/puma.state"
workers 2
threads 6, 6
bind "unix:#{app_path}/shared/tmp/sockets/puma.sock"
preload_app!
