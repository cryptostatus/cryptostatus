require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: :auth
    end
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter-opener"
  end
end
