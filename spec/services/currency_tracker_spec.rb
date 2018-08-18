# frozen_string_literal: true

describe CurrencyTracker do
  let(:prices) do
    {
      'BTC' => {
        'USD' => 0.01
      }
    }
  end

  before do
    allow(subject).to receive(:prices).and_return(prices)
    allow(Currency).to receive_message_chain(:names, :keys).and_return(['BTC'])
  end

  describe '#call' do
    it 'creates Currency entity with last price' do
      expect { subject.call }.to change { Currency.count }.by(1)

      currency = Currency.last

      expect(currency.name).to eq('BTC')
      expect(currency.price).to eq(0.01)
    end
  end
end
