Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*'
    resource '*',
             headers: :any, methods: :any,
             expose: ['token', 'expiry', 'token-type', 'uid', 'client-id']
  end
end
