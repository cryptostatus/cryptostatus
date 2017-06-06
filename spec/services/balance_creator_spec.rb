describe BalanceCreator, type: :service do
  let(:user) { create :user }
  let(:params) do
    {
      amount: 2,
      invested: 200,
      profit_percent: 20,
      name: 'BTC',
      strategy: 'seller'
    }
  end

  describe '.call' do
    it 'should create balance' do
      form = BalanceForm.from_params(params)
      expect { BalanceCreator.call(form, user) }.to change { Balance.count }.by(1)
    end
  end
end
