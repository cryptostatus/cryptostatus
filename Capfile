require 'capistrano/setup'
require 'capistrano/deploy'
require "capistrano/scm/git"
install_plugin Capistrano::SCM::Git

require 'rvm1/capistrano3'
require 'capistrano/bundler'
require 'capistrano/rails/migrations'
require 'capistrano/sidekiq'
# require 'whenever/capistrano'
Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }
