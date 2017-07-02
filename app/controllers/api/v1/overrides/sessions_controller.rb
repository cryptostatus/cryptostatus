# frozen_string_literal: true

module Api
  module V1
    module Overrides
      class SessionsController < DeviseTokenAuth::SessionsController
        extend SessionsDoc

        create_doc
        def create
          super
        end

        destroy_doc
        def destroy
          super
        end

        protected

        def render_create_success
          render json: @resource, status: :created
        end

        def render_destroy_success
          head 204
        end
      end
    end
  end
end
