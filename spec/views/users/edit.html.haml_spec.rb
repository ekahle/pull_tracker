require 'spec_helper'

describe 'users/edit' do
  before(:each) {assign(:user, FactoryGirl.create(:user))}

  it 'renders new user form' do
    render
    expect(rendered).to render_template partial: 'layouts/_page_header'
    expect(rendered).not_to have_selector 'h1'
    assert_select "form#edit_user_#{User.last.id}[action=?][method=?]", user_path(User.last), 'post'
  end
end
