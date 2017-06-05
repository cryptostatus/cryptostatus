lock '3.7.2'

set :application, 'cryptostatus'
set :repo_url, 'git@github.com:kirillshevch/cryptostatus.git'

set :use_sudo, false
set :deploy_via, :copy
set :keep_releases, 2

set :log_level, :debug
set :pty, false

set :rvm1_ruby_version, 'ruby-2.4.1'
set :rvm1_map_bins, %w(rake gem bundle ruby rails sidekiq sidekiqctl whenever)

set :rvm_type, :user
set :default_env, { rvm_bin_path: '~/.rvm/bin' }

set :linked_files, ['.env']
set :linked_dirs, ['log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle']

namespace :deploy do
  desc 'create_db'
  task :create_db do
    on roles(:app) do
      invoke 'rvm1:hook'
      within release_path do
        execute :bundle, :exec, :"rails db:create RAILS_ENV=#{fetch(:stage)}"
      end
    end
  end

  desc 'Uploads required config files'
  task :upload_configs do
    on roles(:all) do
      upload!(".env.#{fetch(:stage)}", "#{deploy_to}/shared/.env")
    end
  end

  desc 'Seeds database'
  task :seed do
    on roles(:app) do
      invoke 'rvm1:hook'
      within release_path do
        execute :bundle, :exec, :"rails db:seed RAILS_ENV=#{fetch(:stage)}"
      end
    end
  end

  before 'deploy:migrate', 'deploy:create_db'
  after :finished, 'deploy:seed'
  after :finished, 'app:restart'
end

namespace :app do
  desc 'Start application'
  task :start do
    on roles(:app) do
      invoke 'rvm1:hook'
      within "#{fetch(:deploy_to)}/current/" do
        execute :bundle, :exec, :"puma -C config/puma.rb -e #{fetch(:stage)}"
      end
    end
  end

  desc 'Stop application'
  task :stop do
    on roles(:app) do
      invoke 'rvm1:hook'
      within "#{fetch(:deploy_to)}/current/" do
        execute :bundle, :exec, :'pumactl -F config/puma.rb stop'
      end
    end
  end

  desc 'Restart application'
  task :restart do
    on roles(:app) do
      invoke 'rvm1:hook'
      within "#{fetch(:deploy_to)}/current/" do
        if test("[ -f #{deploy_to}/current/tmp/pids/puma.pid ]")
          execute :bundle, :exec, :'pumactl -F config/puma.rb stop'
        end

        execute :bundle, :exec, :"whenever --update-crontab"
        execute :bundle, :exec, :"puma -C config/puma.rb -e #{fetch(:stage)}"
      end
    end
  end
end
