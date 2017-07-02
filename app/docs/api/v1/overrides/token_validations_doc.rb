module Api
  module V1
    module Overrides
      module TokenValidationsDoc
        include Api::V1::BaseDoc

        def validate_token_doc
          base_doc
          api :GET, '/auth/validate_token', 'Validate token'
          headers
        end
      end
    end
  end
end
