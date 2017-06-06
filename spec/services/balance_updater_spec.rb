# frozen_string_literal: true

describe BalanceUpdater, type: :service do
  let(:user)    { create :user }
  let(:balance) { create :balance }

  let(:params) do
    {
      amount: 2,
      invested: 200,
      profit_percent: 20,
      name: 'BTC',
      strategy: 'seller'
    }
  end

  context '.call' do
    it 'should update balance' do
      form = BalanceForm.from_params(params)

      expect { BalanceUpdater.call(form, balance, user) }.to change(balance, :price_per_item).to(100.0)
    end
  end
end
