require_relative '../../../../apps/web/controllers/links/show'

RSpec.describe Web::Controllers::Links::Show do
  let(:action) { described_class.new }
  let(:params) { Hash[id: link.key] }
  let(:link)   { repo.create(url: 'google.com', key: '123') }

  let(:repo) { LinkRepository.new }

  after { repo.clear }

  context 'when link exist' do
    it { expect(action.call(params)).to redirect_to('google.com') }

    it 'change link count' do
      expect(repo.find(link.id).clicks).to eq 0
      action.call(params)
      expect(repo.find(link.id).clicks).to eq 1
    end
  end

  context 'when link does not exist' do
    let(:params) { Hash[id: ''] }

    it 'returns error message' do
      response = action.call(params)
      expect(response[2]).to eq ['Not found']
    end
  end
end
