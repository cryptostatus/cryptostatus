# frozen_string_literal: true

describe UserMailer do
  describe '#take_profit_email' do
    let(:balance) { create(:balance) }

    subject { UserMailer.take_profit_email(balance).deliver }

    before do
      allow(balance).to receive(:current_price_per_item).and_return(100)
    end

    it { expect(subject.to  ).to match_array([balance.user.email]) }
    it { expect(subject.from).to match_array(['no-reply@cryptostat.us']) }
  end
end
