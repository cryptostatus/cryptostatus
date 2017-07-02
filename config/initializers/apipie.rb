
Apipie.configure do |config|
  config.app_name                = 'Cryptostatus'
  config.api_base_url            = '/api'
  config.api_base_url['v1']      = '/api/v1'
  config.doc_base_url            = '/apidoc'
  config.doc_path                = 'public'

  config.app_info = 'API documentation for Cryptostatus application'

  # where is your API defined?
  config.api_controllers_matcher = File.join(Rails.root, 'app', 'controllers', '**', '*_controller.rb')
  config.api_routes = Rails.application.routes
  config.validate = false
  config.show_all_examples = true
  config.namespaced_resources = true

  config.default_version = 'v1'
end
