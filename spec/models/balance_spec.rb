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
end
