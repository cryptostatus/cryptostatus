# frozen_string_literal: true

class ApplicationResponder < ActionController::Responder
  include Responders::HttpCacheResponder
  include Responders::JsonResponder
end
