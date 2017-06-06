# frozen_string_literal: true

RSpec.describe CurrencyTracker do
  let(:prices) do
    {
      'BTC' => [
        0.01,
        0.02,
        0.03
      ]
    }
  end

  before { allow(subject).to receive(:prices).and_return(prices) }

  describe '#call' do
    it 'creates Currency entity with last price' do
      expect { subject.call }.to change { Currency.count }.by(1)

      currency = Currency.last

      expect(currency.name).to eq('BTC')
      expect(currency.price).to eq(0.03)
    end
  end
end
