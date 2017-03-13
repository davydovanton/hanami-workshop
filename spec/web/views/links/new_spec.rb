require_relative '../../../../apps/web/views/links/new'

RSpec.describe Web::Views::Links::New do
  let(:exposures) { {} }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/links/new.html.slim') }
  let(:view)      { described_class.new(template, exposures) }
  let(:rendered)  { view.render }

end
