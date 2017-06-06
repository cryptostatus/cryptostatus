# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: :auth

      resources :balances, only: %i[index create update destroy]
    end
  end

  mount LetterOpenerWeb::Engine, at: '/letter-opener' if Rails.env.development?
end
