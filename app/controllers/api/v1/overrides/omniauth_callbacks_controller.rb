module Api
  module V1
    module Overrides
      class OmniauthCallbacksController < DeviseTokenAuth::OmniauthCallbacksController
        before_action :check_auth_info

        def get_resource_from_auth_hash
          info = auth_hash['info']
          @resource = resource_class.find_or_initialize_by(email: info['email'])
          @resource.uid = auth_hash['uid']
          @resource.provider = auth_hash['provider']

          if @resource.new_record?
            @oauth_registration = true
            set_random_password
          end

          assign_provider_attrs(@resource, auth_hash)

          extra_params = whitelisted_params
          @resource.assign_attributes(extra_params) if extra_params

          @resource
        end

        def auth_origin_url
          ENV['OAUTH_SUCCESS']
        end

        def create_auth_params
          @auth_params = {
            'access-token': @token,
            'client': @client_id,
            'uid': @resource.uid
          }

          @auth_params[:oauth_registration] = true if @oauth_registration
          @auth_params
        end

        def assign_provider_attrs(user, auth_hash)
          user.assign_attributes(
            name: auth_hash['info']['name'],
            email: auth_hash['info']['email']
          )
        end

        private

        def check_auth_info
          return if !auth_hash || auth_hash['info']['email']
          redirect_to_with_params ENV['OAUTH_FAILURE'], error: I18n.t('errors.oauth_email_blank')
        end
      end
    end
  end
end
