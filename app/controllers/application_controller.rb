# frozen_string_literal: true

require 'application_responder'

class ApplicationController < ActionController::Base
  include Redirect

  self.responder = ApplicationResponder

  protect_from_forgery with: :null_session
end
