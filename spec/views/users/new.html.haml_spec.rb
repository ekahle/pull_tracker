require 'spec_helper'

describe 'users/new' do
  before(:each) {assign(:user, User.new)}

  it 'renders new user form' do
    render
    expect(rendered).to render_template partial: 'layouts/_page_header'
    expect(rendered).not_to have_selector 'h1'
    assert_select 'form#new_user[action=?][method=?]', users_path, 'post'
  end
end
