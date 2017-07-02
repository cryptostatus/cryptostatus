# frozen_string_literal: true

module Api
  module V1
    describe BalancesController, type: :controller do
      let(:user) { create :user }
      let(:headers) { user.create_new_auth_token }
      let(:balance) { create :balance, user: user }
      let!(:currency) { create :currency }

      let(:invalid_params) do
        {
          amount: -1,
          invested: 100,
          profit_percent: 9
        }
      end

      let(:params) do
        {
          amount: 2,
          invested: 200,
          profit_percent: 20,
          name: 'BTC',
          strategy: 'buyer'
        }
      end

      before { request.headers.merge! headers }

      describe 'GET #index', :show_in_doc do
        before { create_list :balance, 2, user: user }

        it 'responds with 200' do
          get :index, format: :json
          expect(response).to have_http_status(200)
        end
      end

      describe 'POST #create', :show_in_doc do
        context 'success' do
          it 'responds with 201' do
            post :create, params: params, format: :json
            expect(response).to have_http_status(201)
          end
        end

        context 'errors' do
          it 'responds with 422', :show_in_doc do
            post :create, params: invalid_params, format: :json
            expect(response).to have_http_status(422)
          end
        end
      end

      describe 'PUT #update', :show_in_doc do
        context 'success' do
          it 'responds with 200' do
            put :update, params: params.merge(id: balance.id), format: :json
            expect(response).to have_http_status(200)
          end
        end

        context 'errors' do
          it 'responds with 422' do
            put :update, params: invalid_params.merge(id: balance.id), format: :json
            expect(response).to have_http_status(422)
          end
        end
      end

      describe 'DELETE #destroy', :show_in_doc do
        before { delete :destroy, params: { id: balance.id }, format: :json }

        it 'responds with 204' do
          expect(response).to have_http_status(204)
        end
      end
    end
  end
end
