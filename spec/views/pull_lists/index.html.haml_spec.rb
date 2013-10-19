require 'spec_helper'

describe 'pull_lists/index' do
  before(:each) {assign(:pull_lists, [FactoryGirl.build(:pull_list), FactoryGirl.build(:pull_list)])}

  it 'renders a list of pull_lists' do
    render
    expect(rendered).to render_template partial: 'layouts/_page_header'
    expect(rendered).not_to have_selector 'h1'
    expect(rendered).to have_selector 'table#pull_lists-table'
  end
end
