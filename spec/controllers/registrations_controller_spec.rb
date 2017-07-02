module Api
  module V1
    module Overrides
      describe RegistrationsController, type: :controller do
        let(:params) { attributes_for(:user) }
        let(:invalid_params) { attributes_for(:user, password: nil) }

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
            it 'responds with 422' do
              post :create, params: invalid_params, format: :json
              expect(response).to have_http_status(422)
            end
          end
        end
      end
    end
  end
end
