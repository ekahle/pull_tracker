require 'spec_helper'

describe 'pulls/edit' do
  before(:each) {assign(:pull, FactoryGirl.create(:pull))}

  it 'renders new pull form' do
    render
    expect(rendered).to render_template partial: 'layouts/_page_header'
    expect(rendered).not_to have_selector 'h1'
    assert_select "form#edit_pull_#{Pull.last.id}[action=?][method=?]", pull_path(Pull.last), 'post'
  end
end
