describe Ability do
  let!(:user) { create(:user) }
  let!(:balance) { create(:balance, user: user) }
  let!(:new_balance) { build(:balance, user: user) }
  let!(:second_user) { create(:user) }
  let!(:second_balance) { create(:balance, user: second_user) }
  let!(:second_new_balance) { build(:balance, user: second_user) }

  subject { Ability.new(user) }

  context 'Balance' do
    it { is_expected.to be_able_to(:read, balance) }
    it { is_expected.to be_able_to(:update, balance) }
    it { is_expected.to be_able_to(:destroy, balance) }
    it { is_expected.to be_able_to(:create, new_balance) }

    it { is_expected.not_to be_able_to(:read, second_balance) }
    it { is_expected.not_to be_able_to(:update, second_balance) }
    it { is_expected.not_to be_able_to(:destroy, second_balance) }
    it { is_expected.not_to be_able_to(:destroy, second_new_balance) }
  end
end
