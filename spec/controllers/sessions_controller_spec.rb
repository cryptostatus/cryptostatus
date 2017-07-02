module Api
  module V1
    module Overrides
      describe SessionsController, type: :controller do
        let(:password) { 'password_1' }
        let(:user) { create :user, password: password }
        let(:headers) { user.create_new_auth_token }

        let(:params) { { email: user.email, password: password } }
        let(:invalid_params) { { email: user.email, password: nil } }

        before do
          request.env['devise.mapping'] = Devise.mappings[:api_v1_user]
        end

        describe 'POST #create', :show_in_doc do
          context 'success' do
            it 'responds with 201' do
              post :create, params: params, format: :json
              expect(response).to have_http_status(201)
            end
          end

          context 'errors' do
            it 'responds with 401' do
              post :create, params: invalid_params, format: :json
              expect(response).to have_http_status(401)
            end
          end
        end

        describe 'DELETE #destroy', :show_in_doc do
          context 'success' do
            before { request.headers.merge! headers }

            it 'responds with 204' do
              delete :destroy, params: {}, format: :json
              expect(response).to have_http_status(204)
            end
          end
        end
      end
    end
  end
end
