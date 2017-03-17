require_relative '../../../../apps/admin/views/links/index'

RSpec.describe Admin::Views::Links::Index do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Hanami::View::Template.new('apps/admin/templates/links/index.html.slim') }
  let(:view)      { described_class.new(template, exposures) }
  let(:rendered)  { view.render }

  let(:repo) { LinkRepository.new }

  after { repo.clear }

  describe '#links' do
    before { repo.create(url: 'test') }
    it { expect(view.links).to eq repo.all }
  end
end
