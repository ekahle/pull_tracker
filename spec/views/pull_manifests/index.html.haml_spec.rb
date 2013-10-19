require 'spec_helper'

describe 'pull_manifests/index' do
  before(:each) {assign(:pull_manifests, [FactoryGirl.build(:pull_manifest), FactoryGirl.build(:pull_manifest)])}

  it 'renders a list of pull_manifests' do
    render
    expect(rendered).to render_template partial: 'layouts/_page_header'
    expect(rendered).not_to have_selector 'h1'
    expect(rendered).to have_selector 'table#pull_manifests-table'
  end
end
