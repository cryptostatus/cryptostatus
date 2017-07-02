module Api
  module V1
    module BalancesDoc
      include Api::V1::BaseDoc

      def base_doc
        super
        headers
        forbidden_error
      end

      def index_doc
        base_doc
        api :GET, '/balances', 'Get list of balances'
      end

      def create_doc
        base_doc
        api :POST, '/balances', 'Create Balance'
        param_group :params_group, ::Api::V1::BalancesDoc

        unprocessable_error
      end

      def update_doc
        base_doc
        api :PATCH, '/balances/:id', 'Update Balance'
        param_group :params_group, ::Api::V1::BalancesDoc

        unprocessable_error
      end

      def destroy_doc
        base_doc
        api :DELETE, '/balances/:id', 'Destroy Balance'
      end

      private

      def_param_group :params_group do
        param :name, String, 'Name', required: true
        param :amount, Float, 'Amount', required: true
        param :invested, Float, 'Invested', required: true
        param :strategy, String, 'Strategy', required: true
        param :profit_percent, Float, 'Profit percent', required: true
      end
    end
  end
end
