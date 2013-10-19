require 'spec_helper'

describe 'pull_lists/new' do
  before(:each) {assign(:pull_list, Pull.new)}

  it 'renders new pull_list form' do
    render
    expect(rendered).to render_template partial: 'layouts/_page_header'
    expect(rendered).not_to have_selector 'h1'
    assert_select 'form#new_pull_list[action=?][method=?]', pull_lists_path, 'post'
  end
end
