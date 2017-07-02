# frozen_string_literal: true

module Api
  module V1
    module Overrides
      class TokenValidationsController < DeviseTokenAuth::TokenValidationsController
        extend TokenValidationsDoc

        validate_token_doc
        def validate_token
          super
        end

        protected

        def render_validate_token_success
          render json: @resource
        end
      end
    end
  end
end
