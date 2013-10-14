require 'spec_helper'

describe 'users/show' do
  before(:each) {assign(:user, FactoryGirl.build(:user))}

  it 'renders attributes in <p>' do
    render
    expect(rendered).to render_template partial: 'layouts/_page_header'
    expect(rendered).not_to have_selector 'h1'
    expect(rendered).to have_selector 'div#user-detail'
  end
end
