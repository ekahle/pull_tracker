require 'spec_helper'

describe 'pulls/index' do
  before(:each) {assign(:pulls, [FactoryGirl.build(:pull), FactoryGirl.build(:pull)])}

  it 'renders a list of pulls' do
    render
    expect(rendered).to render_template partial: 'layouts/_page_header'
    expect(rendered).not_to have_selector 'h1'
    expect(rendered).to have_selector 'table#pulls-table'
  end
end
