# frozen_string_literal: true

module Responders
  module JsonResponder
    protected

    def api_behavior
      if post?
        display resource, status: :created
      elsif put? || patch? || delete?
        display resource, status: :ok
      else
        super
      end
    end
  end
end
