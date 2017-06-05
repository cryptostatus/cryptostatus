# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BalanceNotifier do
  describe '#call' do
    let(:balance) { create(:balance) }

    it 'marks as notified and sends an email' do
      expect(balance).to receive(:mark_as_notified!)

      expect(UserMailer).to receive(:take_profit_email).with(balance).and_return(
        double('email').tap { |email| expect(email).to receive(:deliver_later) }
      )

      BalanceNotifier.call(balance)
    end
  end
end
