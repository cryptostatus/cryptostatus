describe Ability do
  subject { Ability.new(user) }

  let(:user) { create(:user) }

  describe 'Balance' do
    context 'belongs to user' do
      let(:balance) { build(:balance, user: user) }

      it { is_expected.to be_able_to(:create,  balance) }
      it { is_expected.to be_able_to(:read,    balance) }
      it { is_expected.to be_able_to(:update,  balance) }
      it { is_expected.to be_able_to(:destroy, balance) }
    end

    context 'does not belong to user' do
      let(:balance) { build(:balance) }

      it { is_expected.not_to be_able_to(:create,  balance) }
      it { is_expected.not_to be_able_to(:read,    balance) }
      it { is_expected.not_to be_able_to(:update,  balance) }
      it { is_expected.not_to be_able_to(:destroy, balance) }
    end
  end
end
