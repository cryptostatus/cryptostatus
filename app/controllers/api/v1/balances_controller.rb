module Api
  module V1
    class BalancesController < ApplicationController
      authorize_resource
      load_resource through: :current_user, only: [:index, :update, :destroy]

      def index
        respond_with :api, :v1, BalanceSerializer.serialize_collection(@balances)
      end

      def create
        form = BalanceForm.from_params(balance_params)
        BalanceCreator.call(form, current_user) do
          on(:result) do |balance|
            respond_with :api, :v1, BalanceSerializer.new(balance)
          end
        end
      end

      def update
        form = BalanceForm.from_params(balance_params)
        BalanceUpdater.call(form, @balance) do
          on(:result) { |balance| respond_with :api, :v1, balance }
        end
      end

      def destroy
        respond_with :api, :v1, @balance.destroy
      end

      private

      def balance_params
        params.permit(:amount, :invested, :profit_percent, :strategy, :name)
      end
    end
  end
end
