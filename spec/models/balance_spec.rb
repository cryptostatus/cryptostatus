describe Balance, type: :model do
  context 'Before validation' do
    it '#set_price_per_item' do
      user = create :user
      params = {
        user_id: User.last.id,
        amount: 2,
        invested: 200,
        profit_percent: 20,
        strategy: 'buyer'
      }
      subject = Balance.create(params)
      expect(subject.price_per_item).to eq(100)
    end
  end

  describe 'Scopes' do
    describe 'notifiable' do
      subject { described_class.notifiable }

      let(:user) { create(:user) }

      context '' do
        before { create(:balance, notified_at: nil, user: user) }

        it { is_expected.to be_present }
      end

      context '' do
        before { create(:balance, notified_at: 24.minutes.ago, user: user) }

        it { is_expected.to be_empty }
      end

      context '' do
        before { create(:balance, notified_at: 26.minutes.ago, user: user) }

        it { is_expected.to be_present }
      end
    end
  end
end
