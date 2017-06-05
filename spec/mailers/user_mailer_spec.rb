# frozen_string_literal: true

RSpec.describe UserMailer do
  describe '#take_profit_email' do
    let(:balance) { create(:balance) }

    subject { UserMailer.take_profit_email(balance).deliver }

    it { expect(subject.to  ).to match_array([balance.user.email]) }
    it { expect(subject.from).to match_array(['no-reply@cryptostat.us']) }

    it { expect(subject.subject     ).to include('Take your profit!') }
    it { expect(subject.body.encoded).to include('Take your profit!') }
  end
end
