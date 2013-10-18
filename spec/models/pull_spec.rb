require 'spec_helper'

describe Pull do
  it 'must have a valid factory' do
    expect(FactoryGirl.build(:pull)).to be_valid
    expect(FactoryGirl.create(:pull)).to be_true
    expect(FactoryGirl.create(:pull)).to be_true
  end

  it 'must have a status' do
    expect(FactoryGirl.build(:pull, status: nil)).to be_invalid
    expect(FactoryGirl.build(:pull, status: '')).to be_invalid
  end

  it 'must have a description' do
    expect(FactoryGirl.build(:pull, description: nil)).to be_invalid
    expect(FactoryGirl.build(:pull, description: '')).to be_invalid
  end

  it 'must have a specimen type' do
    expect(FactoryGirl.build(:pull, specimen_type: nil)).to be_invalid
    expect(FactoryGirl.build(:pull, specimen_type: '')).to be_invalid
  end

  it 'should create a pull name from attributes' do
    pull = FactoryGirl.build(:pull)
    expect(pull.name).to match Regexp.new "^Pull #{pull.id}$"
  end
end
