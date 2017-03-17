RSpec.describe Account do
  describe '#registred?' do
    context 'when anonim account' do
      let(:account) { Account.new }
      it { expect(account.registred?).to be false }
    end

    context 'when registred account' do
      let(:account) { Account.new(id: 1) }
      it { expect(account.registred?).to be true }
    end
  end
end
