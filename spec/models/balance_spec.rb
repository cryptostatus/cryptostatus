# frozen_string_literal: true

describe Balance, type: :model do
  describe 'Scopes' do
    describe 'should_be_notified' do
      subject { described_class.should_be_notified }

      let(:user) { create(:user) }

      context do
        before { create(:balance, notified_at: nil, user: user) }

        it { is_expected.to be_present }
      end

      context do
        before { create(:balance, notified_at: 23.hours.ago, user: user) }

        it { is_expected.to be_empty }
      end

      context do
        before { create(:balance, notified_at: 1.day.ago, user: user) }

        it { is_expected.to be_present }
      end
    end
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:user) }
    it { is_expected.to validate_presence_of(:amount) }
    it { is_expected.to validate_presence_of(:price_per_item) }
    it { is_expected.to validate_presence_of(:profit_percent) }
    it { is_expected.to validate_presence_of(:strategy) }
    it { is_expected.to validate_numericality_of(:amount).is_greater_than_or_equal_to(0.000001) }
    it { is_expected.to validate_numericality_of(:amount).is_less_than_or_equal_to(999999) }

    it { is_expected.to validate_numericality_of(:profit_percent).is_greater_than_or_equal_to(0.01) }
    it { is_expected.to validate_numericality_of(:profit_percent).is_less_than_or_equal_to(1) }

    it { is_expected.to validate_numericality_of(:price_per_item).is_greater_than_or_equal_to(0.000001) }
    it { is_expected.to validate_numericality_of(:price_per_item).is_less_than_or_equal_to(999999) }
  end

  describe '#mark_as_notified!' do
    let(:balance) { create(:balance, notified_at: nil) }

    before { balance.mark_as_notified! }

    it 'updates notified_at property' do
      expect(balance.notified_at).not_to be_nil
    end
  end

  describe '#invested' do
    let(:balance) { create(:balance, amount: 10, price_per_item: 10) }

    it 'returns invested money' do
      expect(balance.invested).to eq(100)
    end
  end

  describe '#current_price_per_item' do
    let(:balance) { create(:balance) }
    let!(:currency) { create(:currency) }

    it { expect(balance.current_price_per_item).to eq(currency.price) }
  end

  describe '#current_balance_price' do
    let(:balance) { create(:balance, amount: 2) }
    let!(:currency) { create(:currency, price: 15) }

    it { expect(balance.current_balance_price).to eq(30) }
  end

  describe '#current_profit_percent' do
    let(:balance) { create(:balance, amount: 1, price_per_item: 10) }
    let!(:currency) { create(:currency, price: 15) }

    it { expect(balance.current_profit_percent).to eq(0.5) }
  end
end
