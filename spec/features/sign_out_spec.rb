require 'spec_helper'

describe 'signing out' do

  before :all do
    DatabaseCleaner.clean_with(:truncation)
    FactoryGirl.create(:user,
      first_name: 'John',
      last_name: 'Doe',
      email: 'jd@example.com',
      password: 'password'
    )
    visit '/users/sign_in'
    fill_in 'Email', with: 'jd@example.com'
    fill_in 'Password', with: 'password'
    click_button 'Sign in'
  end

  it 'alerts the user of successful sign in and redirects to the sign in page' do
    click_link 'Sign out'
    expect(page).to have_selector('.alert-success', text: 'Signed out successfully')
    expect(current_path).to eq(new_user_session_path)
  end
end
