# frozen_string_literal: true

module Api
  module V1
    class BalancesController < Api::V1::ApplicationController
      extend BalancesDoc
      load_and_authorize_resource only: %i[index update destroy]

      index_doc
      def index
        respond_with @balances
      end

      create_doc
      def create
        BalanceCreator.call(balance_form, current_user) do
          on(:result) { |balance| respond_with balance }
        end
      end

      update_doc
      def update
        BalanceUpdater.call(balance_form, @balance, current_user) do
          on(:result) { |balance| respond_with balance }
        end
      end

      destroy_doc
      def destroy
        @balance.destroy

        respond_with @balance
      end

      private

      def balance_form
        @balance_form ||= BalanceForm.from_params(params)
      end
    end
  end
end
