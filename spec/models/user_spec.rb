require 'spec_helper'

describe User do
  it 'must have a valid factory' do
    expect(FactoryGirl.build(:user).valid?).to be_true
  end

  it 'must have a first and last name' do
    expect(FactoryGirl.build(:user, first_name: '').valid?).to be_false
    expect(FactoryGirl.build(:user, last_name: '').valid?).to be_false
  end

  it 'must have an email address that looks like an email address' do
    expect(FactoryGirl.build(:user, email: 'foo').valid?).to be_false
    expect(FactoryGirl.build(:user, email: 'foo@bar').valid?).to be_false
    expect(FactoryGirl.build(:user, email: 'foo.bar').valid?).to be_false
    expect(FactoryGirl.build(:user, email: 'foo@bar.baz').valid?).to be_true
  end

  it 'must have a unique email address' do
    user_params = FactoryGirl.attributes_for(:user)
    User.create! user_params
    expect {User.create! user_params}.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'must have a password that is at least eight characters long' do
    expect(FactoryGirl.build(:user, password: 'pw').valid?).to be_false
    expect(FactoryGirl.build(:user, password: 'password').valid?).to be_true
  end
end
