require 'spec_helper'

describe 'pull_manifests/edit' do
  before(:each) {assign(:pull_manifest, FactoryGirl.create(:pull_manifest))}

  it 'renders new pull_manifest form' do
    render
    expect(rendered).to render_template partial: 'layouts/_page_header'
    expect(rendered).not_to have_selector 'h1'
    assert_select "form#edit_pull_manifest_#{Pull.last.id}[action=?][method=?]", pull_manifest_path(Pull.last), 'post'
  end
end
