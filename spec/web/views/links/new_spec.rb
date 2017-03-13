require_relative '../../../../apps/web/views/links/new'

RSpec.describe Web::Views::Links::New do
  let(:exposures) { { params: {} } }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/links/new.html.slim') }
  let(:view)      { described_class.new(template, exposures) }
  let(:rendered)  { view.render }

  describe '#form' do
    it { expect(view.form).to have_method(:post) }
    it { expect(view.form).to have_action('/links') }
  end

end
