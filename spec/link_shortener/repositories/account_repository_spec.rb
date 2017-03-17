RSpec.describe AccountRepository do
  let(:repo) { AccountRepository.new }

  after { repo.clear }

  describe '#find_by_login' do
    context 'when account with test login exist' do
      before { repo.create(login: 'test') }

      it 'returns account' do
        account = repo.find_by_login('test')
        expect(account.login).to eq 'test'
      end
    end

    context 'when account with test login not exist' do
      it { expect(repo.find_by_login('test')).to eq nil }
    end
  end
end
