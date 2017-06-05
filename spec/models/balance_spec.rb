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
        before { create(:balance, notified_at: 24.minutes.ago, user: user) }

        it { is_expected.to be_empty }
      end

      context do
        before { create(:balance, notified_at: 26.minutes.ago, user: user) }

        it { is_expected.to be_present }
      end
    end
  end

  describe '#mark_as_notified!' do
    let(:balance) { create(:balance, notified_at: nil) }

    before { balance.mark_as_notified! }

    it 'updates notified_at property' do
      expect(balance.notified_at).not_to be_nil
    end
  end
end
