require_relative '../../../../apps/web/views/links/new'

RSpec.describe Web::Views::Links::New do
  let(:exposures) { { params: {} } }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/links/new.html.slim') }
  let(:view)      { described_class.new(template, exposures) }
  let(:rendered)  { view.render }

  let(:repo) { LinkRepository.new }

  after { repo.clear }

  describe '#form' do
    it { expect(view.form).to have_method(:post) }
    it { expect(view.form).to have_action('/links') }
  end

  describe '#last_created_link' do
    context 'when db is empty' do
      it { expect(view.last_created_link).to eq nil }
    end

    context 'when db contain some links' do
      before { repo.create(key: '123', url: 'http://dry-rb.org/gems/dry-auto_inject/') }
      it { expect(view.last_created_link).to eq "site.com&#x2F;link&#x2F;123" }
    end
  end
end
