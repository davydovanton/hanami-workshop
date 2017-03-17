require_relative '../../../../apps/admin/views/links/index'

RSpec.describe Admin::Views::Links::Index do
  let(:exposures) { Hash[] }
  let(:template)  { Hanami::View::Template.new('apps/admin/templates/links/index.html.slim') }
  let(:view)      { described_class.new(template, exposures) }
  let(:rendered)  { view.render }


  describe '#links' do
    let(:account_repo) { AccountRepository.new }
    let(:repo) { LinkRepository.new }

    let(:exposures) { Hash[current_account: account] }
    let(:account) { account_repo.create(admin: true) }

    after do
      repo.clear
      account_repo.clear
    end

    before do
      repo.create(url: 'test')
      repo.create(url: 'test for account', account_id: account.id)
    end

    it 'returns all links for current account' do
      expect(view.links.count).to eq 1
      expect(view.links.first.url).to eq 'test for account'
    end
  end

  describe '#short_url' do
    let(:link) { Link.new(key: 'test') }
    it { expect(view.short_url(link)).to eq "http:&#x2F;&#x2F;localhost:2300&#x2F;links&#x2F;test" }
  end
end
