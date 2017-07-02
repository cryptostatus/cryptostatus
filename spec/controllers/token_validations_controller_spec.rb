module Api
  module V1
    module Overrides
      describe TokenValidationsController, type: :controller do
        let(:user) { create :user }
        let(:headers) { user.create_new_auth_token }

        before do
          request.env['devise.mapping'] = Devise.mappings[:api_v1_user]
        end

        describe 'GET #validate_token', :show_in_doc do
          context 'success' do
            before { request.headers.merge! headers }

            it 'responds with 200' do
              get :validate_token, params: {}, format: :json
              expect(response).to have_http_status(200)
            end
          end

          context 'errors' do
            it 'responds with 401' do
              get :validate_token, params: {}, format: :json
              expect(response).to have_http_status(401)
            end
          end
        end
      end
    end
  end
end
