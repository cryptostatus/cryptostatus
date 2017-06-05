# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BalanceNotifier do
  describe '#call' do
    after { BalanceNotifier.call(balance) }

    context 'balance is nil' do
      let(:balance) { nil }

      it 'does nothing' do
        expect(balance).not_to receive(:mark_as_notified!)
        expect(UserMailer).not_to receive(:take_profit_email)
      end
    end

    context 'balance is not nil' do
      let(:balance) { create(:balance) }

      it 'marks as notified and sends an email' do
        expect(balance).to receive(:mark_as_notified!)

        expect(UserMailer).to receive(:take_profit_email).with(balance).and_return(
          double('email').tap { |email| expect(email).to receive(:deliver_later) }
        )
      end
    end
  end
end
