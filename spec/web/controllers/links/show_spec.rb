require_relative '../../../../apps/web/controllers/links/show'

RSpec.describe Web::Controllers::Links::Show do
  let(:action) { described_class.new }
  let(:params) { Hash[id: link.id] }
  let(:link)   { LinkRepository.new.create(url: 'google.com') }

  context 'when link exist' do
    it { expect(action.call(params)).to redirect_to('google.com') }
  end

  context 'when link does not exist' do
    let(:params) { Hash[id: 0] }

    it 'returns error message' do
      response = action.call(params)
      expect(response[2]).to eq ['Not found']
    end
  end
end
