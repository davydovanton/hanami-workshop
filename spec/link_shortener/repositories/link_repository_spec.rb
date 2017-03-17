RSpec.describe LinkRepository do
  let(:repo) { LinkRepository.new }

  after { repo.clear }

  describe '#find_by_key' do
    context 'when db is empty' do
      it { expect(repo.find_by_key('123')).to eq nil }
    end

    context 'when db contain some links' do
      let(:link) { repo.create(key: '123', url: 'http://dry-rb.org/gems/dry-auto_inject/') }
      it { expect(repo.find_by_key(link.key)).to eq link }
    end
  end

  describe '#for_account' do
    context 'when db is empty' do
      it { expect(repo.for_account(nil)).to eq [] }
    end

    context 'when account does not have links' do
      let(:link) { repo.create(key: '123', url: 'http://dry-rb.org/gems/dry-auto_inject/') }
      it { expect(repo.for_account(1)).to eq [] }
    end

    context 'when db contain some links with account id' do
      let(:account) { AccountRepository.new.create(admin: true) }
      let(:link) { repo.create(account_id: account.id, url: 'http://dry-rb.org/gems/dry-auto_inject/') }

      # it { expect(repo.for_account(account.id)).to eq [link] }

      after { AccountRepository.new.clear }
    end
  end
end
