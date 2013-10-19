require 'spec_helper'

describe 'pull_manifests/show' do
  before(:each) {assign(:pull_manifest, FactoryGirl.build(:pull_manifest))}

  it 'renders attributes in <p>' do
    render
    expect(rendered).to render_template partial: 'layouts/_page_header'
    expect(rendered).not_to have_selector 'h1'
    expect(rendered).to have_selector 'div#pull_manifest-detail'
  end
end
