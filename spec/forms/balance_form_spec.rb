describe BalanceForm, type: :form do
  let(:user) { create :user }
  let(:params) do
    {
      user_id: user.id,
      amount: 2,
      invested: 200,
      profit_percent: 20,
      strategy: 'buyer'
    }
  end

  context 'Before validation' do
    before do
      @form = BalanceForm.from_params(params)
    end

    it 'set price_per_item' do
      expect { @form.valid? }.to change(@form, :price_per_item).from(nil).to(100)
    end

    it 'update profit_percent' do
      expect { @form.valid? }.to change(@form, :profit_percent).from(20).to(0.2)
    end
  end

  it '#attributes' do
    form = BalanceForm.from_params(params)
    form.valid?
    expect(form.attributes.keys).not_to include(:invested)
    expect(form.attributes[:price_per_item]).to eq(100)
  end
end
