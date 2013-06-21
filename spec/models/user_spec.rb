require 'spec_helper'

describe User do
  it 'must have a valid factory' do
    expect(FactoryGirl.build(:user)).to be_valid
    expect(FactoryGirl.create(:user)).to be_true
    expect(FactoryGirl.create(:user)).to be_true
  end

  it 'must have a first and last name' do
    expect(FactoryGirl.build(:user, first_name: '')).to be_invalid
    expect(FactoryGirl.build(:user, last_name: '')).to be_invalid
  end

  it 'must have an email address that looks like an email address' do
    expect(FactoryGirl.build(:user, email: 'foo')).to be_invalid
    expect(FactoryGirl.build(:user, email: 'foo@bar')).to be_invalid
    expect(FactoryGirl.build(:user, email: 'foo.bar')).to be_invalid
    expect(FactoryGirl.build(:user, email: 'foo@bar.baz')).to be_valid
  end

  it 'must have a unique email address' do
    user = FactoryGirl.create(:user)
    expect {FactoryGirl.create(:user, email: user.email)}.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'must have a password that is at least eight characters long' do
    expect(FactoryGirl.build(:user, password: 'pw')).to be_invalid
    expect(FactoryGirl.build(:user, password: 'password')).to be_valid
  end

  it 'should concatenate first and last names into the full name' do
    expect(FactoryGirl.build(:user).full_name).to match /^John Doe$/
  end
end
