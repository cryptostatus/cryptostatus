module Api
  module V1
    module Overrides
      module RegistrationsDoc
        include Api::V1::BaseDoc

        def create_doc
          base_doc
          api :POST, '/auth', 'Sign up'
          param :email, String, 'Email', required: true
          param :password, String, 'Password', required: true
          param :password_confirmation, String, 'Password Confirmation', required: true
          unprocessable_error
        end
      end
    end
  end
end
