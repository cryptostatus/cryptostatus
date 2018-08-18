Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins ENV['CLIENT_DOMAIN']
    resource '*',
             headers: :any, methods: :any,
             expose: ['token', 'expiry', 'token-type', 'uid', 'client-id']
  end
end
