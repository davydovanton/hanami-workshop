require_relative '../../../../apps/admin/controllers/links/index'

RSpec.describe Admin::Controllers::Links::Index do
  let(:action) { described_class.new }
  let(:params) { Hash[] }

  context 'when admin is not login' do
    it { expect(action.call(params)).to redirect_to('/admin') }
  end
end
