require_relative '../../../../apps/web/controllers/links/show'

RSpec.describe Web::Controllers::Links::Show do
  let(:action) { described_class.new }
  let(:params) { Hash[id: 1] }

  it 'is successful' do
    response = action.call(params)
    expect(response).to redirect_to('google.com')
  end
end
