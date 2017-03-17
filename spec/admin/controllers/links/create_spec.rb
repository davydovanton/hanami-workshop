require_relative '../../../../apps/admin/controllers/links/create'

RSpec.describe Admin::Controllers::Links::Create do
  let(:action)  { described_class.new }
  let(:session) { { account: account } }
  let(:params)  { { **link_params, 'rack.session' => session } }
  let(:link_params) { {} }
  let(:account) { AccountRepository.new.create(admin: true) }

  let(:repo) { LinkRepository.new }

  after do
    repo.clear
    AccountRepository.new.clear
  end


  context 'when admin is not login' do
    let(:session) { {} }
    it { expect(action.call(params)).to redirect_to('/admin') }
  end

  context 'when url is valid' do
    let(:link_params) { { link: { url: 'http://google.com' } } }

    it 'creates new link object for current account' do
      expect{ action.call(params) }.to change { repo.all.to_a.size }.by(1)
      expect(repo.last.key).to_not be nil
      expect(repo.last.account_id).to eq account.id
    end

    it 'redirects to root page' do
      expect(action.call(params)).to redirect_to('/admin/links')
    end
  end

  context 'when url is invalid' do
    let(:link_params) { { link: { url: '' } } }

    it 'does not create new link object' do
      expect{ action.call(params) }.to change { repo.all.to_a.size }.by(0)
    end

    it 'redirects to root page' do
      expect(action.call(params)).to redirect_to('/admin/links')
    end
  end
end
