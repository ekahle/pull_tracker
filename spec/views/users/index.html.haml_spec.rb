require 'spec_helper'

describe 'users/index' do
  before(:each) {assign(:users, [FactoryGirl.build(:user), FactoryGirl.build(:user)])}

  it 'renders a list of users' do
    render
    expect(rendered).to render_template partial: 'layouts/_page_header'
    expect(rendered).not_to have_selector 'h1'
    expect(rendered).to have_selector 'table#users-table'
  end
end
