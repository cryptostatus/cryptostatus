# frozen_string_literal: true

module Api
  module V1
    class ApplicationController < ::ApplicationController
      include DeviseTokenAuth::Concerns::SetUserByToken

      respond_to :json

      alias current_user current_api_v1_user
      alias authenticate_user! authenticate_api_v1_user!
    end
  end
end
