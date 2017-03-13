require_relative '../../../../apps/web/controllers/links/create'

RSpec.describe Web::Controllers::Links::Create do
  let(:action) { described_class.new }
  let(:params) { { link: { url: '' } } }

  let(:repo) { LinkRepository.new }

  context 'when url is valid' do
    let(:params) { { link: { url: 'http://google.com' } } }

    it 'creates new link object' do
      expect{ action.call(params) }.to change { repo.all.to_a.size }.by(1)
      expect(repo.last.key).to_not be nil
    end

    it 'redirects to root page' do
      expect(action.call(params)).to redirect_to('/')
    end

    it 'displays link in flash' do
      action.call(params)
      flash = action.exposures[:flash]
      expect(flash[:info]).to match repo.last.key
    end
  end

  context 'when url is invalid' do
    let(:params) { { link: { url: '' } } }

    it 'does not create new link object' do
      expect{ action.call(params) }.to change { repo.all.to_a.size }.by(0)
    end

    it 'redirects to root page' do
      expect(action.call(params)).to redirect_to('/')
    end

    it 'displays error in flash' do
      action.call(params)
      flash = action.exposures[:flash]
      expect(flash[:error]).to eq 'invalid link'
    end
  end
end
