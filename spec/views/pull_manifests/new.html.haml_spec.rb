require 'spec_helper'

describe 'pull_manifests/new' do
  before(:each) {assign(:pull_manifest, PullManifest.new)}

  it 'renders new pull_manifest form' do
    render
    expect(rendered).to render_template partial: 'layouts/_page_header'
    expect(rendered).not_to have_selector 'h1'
    assert_select 'form#new_pull_manifest[action=?][method=?]', pull_manifests_path, 'post'
  end
end
