require 'spec_helper'

describe 'pulls/show' do
  before(:each) {assign(:pull, FactoryGirl.build(:pull))}

  it 'renders attributes in <p>' do
    render
    expect(rendered).to render_template partial: 'layouts/_page_header'
    expect(rendered).not_to have_selector 'h1'
    expect(rendered).to have_selector 'div#pull-detail'
  end
end
