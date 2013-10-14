require 'spec_helper'

describe 'pulls/new' do
  before(:each) {assign(:pull, Pull.new)}

  it 'renders new pull form' do
    render
    expect(rendered).to render_template partial: 'layouts/_page_header'
    expect(rendered).not_to have_selector 'h1'
    assert_select 'form#new_pull[action=?][method=?]', pulls_path, 'post'
  end
end
