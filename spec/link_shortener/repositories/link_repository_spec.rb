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
end
