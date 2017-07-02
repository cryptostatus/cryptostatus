module Api
  module V1
    module Overrides
      module SessionsDoc
        include Api::V1::BaseDoc

        def create_doc
          base_doc
          api :POST, '/auth/sign_in', 'Sign in'
          param :email, String, 'Email', required: true
          param :password, String, 'Password', required: true

          unauthorized_error
        end

        def destroy_doc
          base_doc
          headers
          api :DELETE, '/auth/sign_out', 'Sign out'

          forbidden_error
        end
      end
    end
  end
end
