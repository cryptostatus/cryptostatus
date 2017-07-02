# frozen_string_literal: true

module Api
  module V1
    class BalancesController < ApplicationController
      extend BalancesDoc
      load_and_authorize_resource only: %i[index update destroy]

      index_doc
      def index
        respond_with @balances
      end

      create_doc
      def create
        form = BalanceForm.from_params(params)

        BalanceCreator.call(form, current_user) do
          on(:result) { |balance| respond_with balance }
        end
      end

      update_doc
      def update
        form = BalanceForm.from_params(params)

        BalanceUpdater.call(form, @balance, current_user) do
          on(:result) { |balance| respond_with balance }
        end
      end

      destroy_doc
      def destroy
        respond_with @balance.destroy
      end
    end
  end
end
