# frozen_string_literal: true

module Api
  module V1
    class BalancesController < ApplicationController
      load_and_authorize_resource through: :current_user, only: %i[index update destroy]

      def index
        respond_with @balances
      end

      def create
        form = BalanceForm.from_params(params)

        BalanceCreator.call(form, current_user) do
          on(:result) { |balance| respond_with balance }
        end
      end

      def update
        form = BalanceForm.from_params(params)

        BalanceUpdater.call(form, @balance, current_user) do
          on(:result) { |balance| respond_with balance }
        end
      end

      def destroy
        respond_with @balance.destroy
      end
    end
  end
end
