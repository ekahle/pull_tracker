require 'spec_helper'

describe 'pull_lists/show' do
  before(:each) {assign(:pull_list, FactoryGirl.build(:pull_list))}

  it 'renders attributes in <p>' do
    render
    expect(rendered).to render_template partial: 'layouts/_page_header'
    expect(rendered).not_to have_selector 'h1'
    expect(rendered).to have_selector 'div#pull_list-detail'
  end
end
