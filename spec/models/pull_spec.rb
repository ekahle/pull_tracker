require 'spec_helper'

describe Pull do
  it 'must have a valid factory' do
    expect(FactoryGirl.build(:pull)).to be_valid
  end

  it 'must have a name' do
    expect(FactoryGirl.build(:pull, name: nil)).to be_invalid
    expect(FactoryGirl.build(:pull, name: '')).to be_invalid
  end

  it 'must have a unique name' do
    pull = FactoryGirl.create(:pull)
    expect {FactoryGirl.create(:pull, name: pull.name)}.to raise_error(ActiveRecord::RecordInvalid)
  end
end
