# frozen_string_literal: true

module Api
  module V1
    module Overrides
      class SessionsController < DeviseTokenAuth::SessionsController
        def render_create_success
          render json: @resource, status: :created
        end
      end
    end
  end
end
