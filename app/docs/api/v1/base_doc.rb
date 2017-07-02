module Api::V1::BaseDoc
  def self.included(base)
    base.extend Apipie::DSL::Concern
  end

  def base_doc
    formats [:json]
    api_version 'v1'
  end

  private

  def forbidden_error
    error 403, 'Forbidden'
  end

  def unauthorized_error
    error 401, 'Unauthorized'
  end

  def unprocessable_error
    error 422, 'Unprocessable entity'
  end

  def not_found_error
    error 404, 'Not Found'
  end

  def headers
    header 'access-token', 'Access-token', required: true
    header 'token-type', 'Token-type', optional: true
    header 'client', 'Client', required: true
    header 'expiry', 'Expiry', optional: true
    header 'uid', 'Uid', required: true
  end
end
