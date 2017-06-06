# frozen_string_literal: true

module Api
  module V1
    class BalancesController < ApplicationController
      authorize_resource
      load_resource through: :current_user, only: %i[index update destroy]

      def index
        respond_with :api, :v1, BalanceSerializer.serialize_collection(@balances)
      end

      def create
        form = BalanceForm.from_params(params)
        BalanceCreator.call(form, current_user) do
          on(:result) do |balance|
            respond_with :api, :v1, BalanceSerializer.new(balance)
          end
        end
      end

      def update
        form = BalanceForm.from_params(params)
        BalanceUpdater.call(form, @balance, current_user) do
          on(:result) do |balance|
            respond_with :api, :v1, BalanceSerializer.new(balance)
          end
        end
      end

      def destroy
        respond_with :api, :v1, @balance.destroy
      end
    end
  end
end
