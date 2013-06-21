require 'spec_helper'

describe 'signing in' do

  before :all do
    DatabaseCleaner.clean_with(:truncation)
    FactoryGirl.create(:user,
      first_name: 'John',
      last_name: 'Doe',
      email: 'jd@example.com',
      password: 'password'
    )
  end

  context 'with a registered email address' do
    context 'and the correct password' do
      it 'alerts user of successful sign in and redirects to the homepage' do
        attempt_to_sign_in('jd@example.com', 'password')
        expect(page).to have_selector('.alert-success', text: 'Signed in successfully')
        expect(page).to have_selector('ul#user-nav li a.dropdown-toggle', text: 'John Doe')
        expect(current_path).to eq(root_path)
      end
    end

    context 'and the incorrect password' do
      it 'alerts user of unsuccessful sign in and remains on the sign in page' do
        attempt_to_sign_in('jd@example.com', 'wrong_password')
        expect(page).to have_selector('.alert-error', text: 'Invalid email or password')
        expect(current_path).to eq(new_user_session_path)
      end
    end

    context 'and no password' do
      it 'alerts user of unsuccessful sign in and remains on the sign in page' do
        attempt_to_sign_in('jd@example.com', '')
        expect(page).to have_selector('.alert-error', text: 'Invalid email or password')
        expect(current_path).to eq(new_user_session_path)
      end
    end
  end

  context 'with an unregistered email address' do
    context 'and a password' do
      it 'alerts user of unsuccessful sign in and remains on the sign in page' do
        attempt_to_sign_in('someone_else@example.com', 'password')
        expect(page).to have_selector('.alert-error', text: 'Invalid email or password')
        expect(current_path).to eq(new_user_session_path)
      end
    end

    context 'and no password' do
      it 'alerts user of unsuccessful sign in and remains on the sign in page' do
        attempt_to_sign_in('someone_else@example.com', '')
        expect(page).to have_selector('.alert-error', text: 'Invalid email or password')
        expect(current_path).to eq(new_user_session_path)
      end
    end
  end

  context 'using a javascript-enabled browser', js: true do
    context 'with an invalid email address' do
      context 'and a password' do
        it 'remains on the sign in page' do
          attempt_to_sign_in('invalid_email', 'password')
          expect(page).not_to have_selector('.alert')
          expect(current_path).to eq(new_user_session_path)
        end
      end

      context 'and no password' do
        it 'remains on the sign in page' do
          attempt_to_sign_in('invalid_email', '')
          expect(page).not_to have_selector('.alert')
          expect(current_path).to eq(new_user_session_path)
        end
      end
    end
  end

  context 'using a javascript-disabled browser', js: false do
    context 'with an invalid email address' do
      context 'and a password' do
        it 'alerts user of unsuccessful sign in and remains on the sign in page' do
          attempt_to_sign_in('invalid_email', 'password')
          expect(page).to have_selector('.alert-error', text: 'Invalid email or password')
          expect(current_path).to eq(new_user_session_path)
        end
      end

      context 'and no password' do
        it 'alerts user of unsuccessful sign in and remains on the sign in page' do
          attempt_to_sign_in('invalid_email', '')
          expect(page).to have_selector('.alert-error', text: 'Invalid email or password')
          expect(current_path).to eq(new_user_session_path)
        end
      end
    end
  end

  private

  def attempt_to_sign_in(email, password)
    visit '/users/sign_in'
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    click_button 'Sign in'
  end
end
