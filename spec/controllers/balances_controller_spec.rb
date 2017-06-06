module Api
  module V1
    describe BalancesController, type: :controller do
      let(:user) { create :user }
      let!(:headers) { user.create_new_auth_token }
      let!(:balance) { create :balance, user: user }
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

      describe 'GET #index' do
        it 'responds with 200' do
          get :index, format: :json
          expect(response).to have_http_status(200)
        end
      end

      describe 'POST #create' do
        it 'responds with 201' do
          post :create, params: params, format: :json
          expect(response).to have_http_status(201)
        end
      end

      describe 'PUT #update' do
        it 'responds with 200' do
          put :update, params: params.merge(id: balance.id), format: :json
          expect(response).to have_http_status(200)
        end
      end

      describe 'DELETE #destroy' do
        before { delete :destroy, params: { id: balance.id }, format: :json }

        it 'responds with 204' do
          expect(response).to have_http_status(204)
        end
      end
    end
  end
end
