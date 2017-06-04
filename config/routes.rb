Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: :auth
    end
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter-opener"
  end
end
