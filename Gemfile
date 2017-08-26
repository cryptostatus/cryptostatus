# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'coffee-rails', '~> 4.2'
gem 'devise_token_auth', '~> 0.1.42'
gem 'dotenv-rails', '~> 2.2'
gem 'haml-rails', '~> 1.0'
gem 'lionshare', '~> 0.1.1'
gem 'omniauth', '~> 1.6', '>= 1.6.1'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'rails', '~> 5.1.1'
gem 'rectify', '~> 0.9.1'
gem 'rubocop', '~> 0.49.1'
gem 'sass-rails', '~> 5.0'
gem 'sidekiq', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'
gem 'rack-cors', require: 'rack/cors'
gem 'responders', '~> 2.4'
gem 'cancancan', '~> 2.0'
gem 'operators-serializer', '~> 0.2.0'
gem 'sentry-raven', '~> 2.5'
gem 'apipie-rails', '~> 0.5.1'
gem 'listen', '~> 3.1.5'
gem 'omniauth-github', '~> 1.1', '>= 1.1.2'
gem 'omniauth-facebook', '~> 4.0.0'
gem 'omniauth-google-oauth2', '~> 0.4.1'
gem 'mini_magick', '~> 4.8'
gem 'twitter', '~> 6.1'
gem 'koala', '~> 3.0'
gem 'sidekiq-scheduler', '~> 2.1.8'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'factory_girl_rails'
  gem 'ffaker'
  gem 'pry-rails'
end

group :development do
  gem 'capistrano', '~> 3.7.2'
  gem 'capistrano-bundler', '1.1.4', require: false
  gem 'capistrano-rails', '1.1.6', require: false
  gem 'capistrano-sidekiq', '~> 0.10.0'
  gem 'rvm1-capistrano3', '1.4.0', require: false
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'database_cleaner'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'wisper-rspec', require: false
end
