# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BalanceForm, type: :form do
  let(:user) { create :user }
  let(:params) do
    {
      user_id: user.id,
      amount: 2,
      invested: 200,
      profit_percent: 20,
      name: 'BTC',
      strategy: 'buyer'
    }
  end

  subject { BalanceForm.from_params(params) }

  context '#attributes' do
    it 'set price_per_item' do
      expect { subject.attributes }.to change(subject, :price_per_item).from(nil).to(100)
    end

    it 'update profit_percent' do
      expect { subject.attributes }.to change(subject, :profit_percent).from(20).to(0.2)
    end
  end

  it '#attributes' do
    expect(subject.attributes.keys).not_to include(:invested)
    expect(subject.attributes[:price_per_item]).to eq(100)
  end
end
