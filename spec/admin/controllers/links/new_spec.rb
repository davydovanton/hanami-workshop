require_relative '../../../../apps/admin/controllers/links/new'

RSpec.describe Admin::Controllers::Links::New do
  let(:action) { described_class.new }
  let(:params) { Hash[] }

  context 'when admin is not login' do
    it { expect(action.call(params)).to redirect_to('/admin') }
  end
end
