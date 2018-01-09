module Api
  module V1
    module Overrides
      class PasswordsController < DeviseTokenAuth::PasswordsController
        def edit
          super do
            redirect_url          = URI.parse(params[:redirect_url])
            reset_params          = { reset_password_token: @resource.reset_password_token }
            redirect_url.query    = Rack::Utils.parse_query(redirect_url.query).merge(reset_params).to_query
            params[:redirect_url] = redirect_url.to_s

            @resource.reset_password_token = Devise.token_generator.digest(
              @resource, :reset_password_token,
              @resource.reset_password_token
            )
            @resource.save(validate: false)
          end
        end

        protected

        def resource_update_method
          @resource.allow_password_change = valid_reset_password_token?
          super
        end

        def valid_reset_password_token?
          return false if @resource.reset_password_token.blank? || @resource.reset_password_token.blank?
          digest = Devise.token_generator.digest(@resource, :reset_password_token, resource_params[:reset_password_token])
          digest == @resource.reset_password_token
        end
      end
    end
  end
end
