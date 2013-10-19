require 'spec_helper'

describe 'pull_lists/edit' do
  before(:each) {assign(:pull_list, FactoryGirl.create(:pull_list))}

  it 'renders new pull_list form' do
    render
    expect(rendered).to render_template partial: 'layouts/_page_header'
    expect(rendered).not_to have_selector 'h1'
    assert_select "form#edit_pull_list_#{Pull.last.id}[action=?][method=?]", pull_list_path(Pull.last), 'post'
  end
end
