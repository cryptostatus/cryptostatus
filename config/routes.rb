require 'sidekiq/web'

Rails.application.routes.draw do
  unless Rails.env.development?
    Sidekiq::Web.use Rack::Auth::Basic do |username, password|
      username == ENV.fetch('SIDEKIQ_USERNAME') &&
        password == ENV.fetch('SIDEKIQ_PASSWORD')
    end
  end

  mount Sidekiq::Web => '/sidekiq'

  apipie
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: :auth, controllers: {
        token_validations: 'api/v1/overrides/token_validations',
        registrations:     'api/v1/overrides/registrations',
        sessions:          'api/v1/overrides/sessions'
      }

      resources :balances, only: %i[index create update destroy]
    end
  end

  mount LetterOpenerWeb::Engine, at: '/letter-opener' if Rails.env.development?
end
