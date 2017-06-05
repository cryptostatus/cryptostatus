source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.1'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'dotenv-rails', '~> 2.2'
gem 'sidekiq', '~> 5.0'
gem 'lionshare', '~> 0.1.0'
gem 'rectify', '~> 0.9.1'
gem 'whenever', '~> 0.9.7', require: false
gem 'devise_token_auth', '~> 0.1.42'
gem 'omniauth', '~> 1.6', '>= 1.6.1'
gem 'rack-cors', :require => 'rack/cors'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'pry-rails'
  gem 'factory_girl_rails'
  gem 'ffaker'
end


group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'capistrano', '~> 3.7.2'
  gem 'capistrano-rails', '1.1.6', require: false
  gem 'capistrano-bundler', '1.1.4', require: false
  gem 'rvm1-capistrano3', '1.4.0', require: false
  gem 'letter_opener_web', '~> 1.3', '>= 1.3.1'
end

group :test do
  gem 'rspec-rails'
  gem 'database_cleaner'
  gem 'shoulda-matchers'
  gem 'wisper-rspec', require: false
end
