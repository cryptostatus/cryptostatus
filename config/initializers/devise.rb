Devise.setup do |config|
  config.mailer_sender = ENV['MAILER_SENDER']
  config.secret_key = ENV['DEVISE_SECRET']
end
